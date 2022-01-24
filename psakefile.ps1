$psake.use_exit_on_error = $true
properties {

    [String]$BuildDestination = "$HOME\Downloads"
    [String]$DeployDestination = "$HOME\Downloads"
    [String]$Tests = '.\tests'
    [String]$Environment = 'dev'

}

task default -depends Clean, PreBuild, Build, Test, Visualize
task CI -depends Clean, PreBuild, Build, Test, Visualize, VersionControl, DeployLocal

$here = Split-Path $MyInvocation.MyCommand.Path -Parent
$Leaf = Split-Path $here -Leaf

$Manifest = Import-PowerShellDataFile -Path "$here\config\AllConfig.psd1"
$Manifest.App.Version = [System.Version]$Manifest.App.Version

task deployLocal {

    Try {

        if($Manifest.App.Version -ne $NewVersion){
            $ZipFileName = "$Leaf-$NewVersion"
            $ZipFileFullPath = "$DeployDestination\$ZipFileName.zip"
            $compress = @{
                Path = "$here\*"
                DestinationPath = $ZipFileFullPath
                CompressionLevel = 'Fastest'
                Force = $true
                ErrorAction = 'Stop'
            }
            Compress-Archive @compress

            $FileHash = Get-FileHash -Path $ZipFileFullPath -Algorithm SHA512 -ErrorAction Stop
            New-Item -Path $DeployDestination -ItemType File -Name "$ZipFileName-Checksum.txt" -Value $FileHash.Hash
        } else {
            "$($Manifest.App.Version) and $($NewVersion) are the same. Nothing new to archive"
        }

    } Catch {

        throw $_

    }

}

task VersionControl {

    if($CommitMessage){
        Try {

            $CommitCode = $true
            switch -regex (git status){
                'nothing to commit, working tree clean'{$CommitCode = $false}
            }

            If($CommitCode){

                switch ($environment) {
                    'prod' { [System.Version]$NewVersion = "$($Manifest.App.Version.Major).$($Manifest.App.Version.Minor + 1).$($Manifest.App.Version.Build)" }
                    'dev' { [System.Version]$NewVersion = "$($Manifest.App.Version.Major).$($Manifest.App.Version.Minor).$($Manifest.App.Version.Build + 1)" }
                    Default { [System.Version]$NewVersion = "$($Manifest.App.Version.Major).$($Manifest.App.Version.Minor).$($Manifest.App.Version.Build)" }
                }

                (Get-Content -Path "$here\config\AllConfig.psd1") -replace $manifest.App.version,$Newversion | Out-File -FilePath "$here\config\AllConfig.psd1" -Force

                if($Manifest.App.Version -ne $NewVersion){
                    git add .
                    git tag -a "v$NewVersion" -m "Version $NewVersion"
                    git commit -m "$CommitMessage"
                    git push
                } else {
                    "$($Manifest.App.Version) and $($NewVersion) are the same. No git changes have been commited."
                }

            } else {

                Write-Output "No changes found. Your commit message '$CommitMessage' will not be applied."

            }

        } Catch {

            throw $_

        }

    } else {

        throw 'If you want to increase the build number include -parameters @{"CommitMessage"="Your commit message";}'

    }

}

task Visualize {

    try {

        foreach ($port in ($Manifest.docker.where{$_.tags -match $environment}.ports)) {

            Start-Process "http://localhost:$(($port -split ':')[0])"

        }

    } catch {

        $_

    }

}

task Test {

    try {

        Write-Host -ForegroundColor Yellow -Object 'Waiting for all ports to become available'
        $counter = 0
        $ports = $Manifest.docker.where{$_.tags -match $environment}.ports

        while ($StatusCode -ne ($ports.count*200)) {

            if($counter -gt 20){break}else{$counter++}

            $StatusCode = 0
            foreach ($port in $ports) {
                try{
                    $StatusCode += (Invoke-WebRequest "http://localhost:$(($port -split ':')[0])").StatusCode
                } catch {
                    $StatusCode += 0
                }
            }

            Start-Sleep -Seconds 1

        }

        Write-Host -ForegroundColor Yellow -Object 'Running tests now'
        # Invoke-Pester -Path $Tests -Output Detailed -Verbose -ErrorAction Stop

    } catch {

        throw $_

    }

}

task Build -depends PreBuild {

    Try {

        Set-Location "$BuildDestination\$($Manifest.App.Name)_$Environment\docker\$Environment"
        docker-compose build --no-cache
        docker-compose up -d

    } Catch {

        throw $_

    }

}

task PreBuild {

    try {

        Copy-Item -Path "$here\config\" -Destination "$BuildDestination\$($Manifest.App.Name)_$Environment\config" -Recurse -ErrorAction Stop
        Copy-Item -Path "$here\docker\" -Destination "$BuildDestination\$($Manifest.App.Name)_$Environment\docker\$Environment" -Recurse -ErrorAction Stop

        # configure dockerfiles, docker-compose and prometheus ports based on environment
        Set-Location "$BuildDestination\$($Manifest.App.Name)_$Environment\docker\$Environment"
        $dockerfiles = Get-ChildItem docker* -Recurse | Select-Object -ExpandProperty FullName
        $dockercomposefiles = Get-ChildItem docker-compose.yaml -Recurse | Select-Object -ExpandProperty FullName
        $restoffiles = Get-ChildItem prometheus.yml,*.json -Recurse | Select-Object -ExpandProperty FullName

        foreach ($dockerfile in $dockerfiles) {
            (Get-Content -Path $dockerfile) -replace '%%environment%%',$Environment | Out-File -FilePath $dockerfile
        }

        foreach ($file in $dockercomposefiles) {
            $Containers = $Manifest.Docker.where{$_.Tags -match $Environment}
            (Get-Content -Path $file) -replace '%%prometheus_port_1%%',$Containers.Where{$_.Name -eq 'prometheus'}.ports | Out-File -FilePath $file
            (Get-Content -Path $file) -replace '%%grafana_port_1%%',$Containers.Where{$_.Name -eq 'grafana'}.ports | Out-File -FilePath $file
            (Get-Content -Path $file) -replace '%%pwsh_port_1%%',$Containers.Where{$_.Name -eq 'pwsh'}.ports | Out-File -FilePath $file
            (Get-Content -Path $file) -replace '%%nodered_port_1%%',$Containers.Where{$_.Name -eq 'node-red'}.ports | Out-File -FilePath $file
            (Get-Content -Path $file) -replace '%%influxdb_port_1%%',$Containers.Where{$_.Name -eq 'influxbd'}.ports | Out-File -FilePath $file
        }

        foreach ($file in $restoffiles) {
            $Containers = $Manifest.Docker.where{$_.Tags -match $Environment}
            (Get-Content -Path $file) -replace '%%prometheus_port_1%%',(($Containers.Where{$_.Name -eq 'prometheus'}.ports -split ':')[0]) | Out-File -FilePath $file
            (Get-Content -Path $file) -replace '%%grafana_port_1%%',(($Containers.Where{$_.Name -eq 'grafana'}.ports -split ':')[0]) | Out-File -FilePath $file
            (Get-Content -Path $file) -replace '%%pwsh_port_1%%',(($Containers.Where{$_.Name -eq 'pwsh'}.ports -split ':')[0]) | Out-File -FilePath $file
            (Get-Content -Path $file) -replace '%%nodered_port_1%%',(($Containers.Where{$_.Name -eq 'node-red'}.ports -split ':')[0]) | Out-File -FilePath $file
            (Get-Content -Path $file) -replace '%%influxdb_port_1%%',(($Containers.Where{$_.Name -eq 'influxbd'}.ports -split ':')[0]) | Out-File -FilePath $file
        }

    } catch {

        $_

    }

}

task Clean {

    Try {

        if(Test-Path "$BuildDestination\$($Manifest.App.Name)_$Environment"){
            Set-Location "$BuildDestination\$($Manifest.App.Name)_$Environment"
            if(Test-Path ".\docker\$Environment"){
                Set-Location -Path .\docker\$Environment
                docker-compose down --remove-orphans --rmi all
            }
            Set-Location $here
            Remove-Item "$BuildDestination\$($Manifest.App.Name)_$Environment" -Recurse -Force
        }
        (docker images -f "dangling=true" -q) ? (docker rmi $(docker images -f "dangling=true" -q)) : $null

    } Catch {

        throw $_

    }

}

task Variables {

    try {

        Write-Output "here = $here"
        Write-Output "Leaf = $Leaf"
        Write-Output "Parameters = $Parameters"
        Write-Output "Version = $($manifest.App.version)"
        Write-Output "Environment = $Environment"
        Write-Output "BuildDestination = $BuildDestination"
        Write-Output "DeployDestination = $DeployDestination"
        Write-Output "CommitMessage = $CommitMessage"

    } catch {

        throw $_

    }

}
