New-PSUEndpoint -Url "/metrics" -Endpoint {
    $results = @()

    # Define all Prometheus metrics
    $ping_latency = New-PromMetricDescription -Name 'pwsh_ping_latency' -Type gauge -Help 'current ping latency' -Labels 'hostname','ip'
    $port_available = New-PromMetricDescription -Name 'pwsh_port_available' -Type gauge -Help 'verifies if port is available on host' -Labels 'hostname','ip','port'

    # Get all nodes
    $config = Import-PowerShellDataFile -Path /home/Universal/.config/AllConfig.psd1
    # $config = Import-PowerShellDataFile -Path .\config\AllConfig.psd1
    $nodes = $config.AllNodes.where{$_.tags -match 'Infrastructure'}

    # Gather all data from each node
    $results = $nodes | foreach -Parallel {
        $node = $_
        if(-not ($node.DoNotPing)){
            $result = Test-Connection -ComputerName $node.ip -Count 1 -ErrorAction SilentlyContinue
            $latency = ($result.Status -eq 'success') ? ($result.latency) : -1
            New-PromMetric -MetricDesc $using:ping_latency -Value $latency -Labels $node.name,$node.ip
        }

        $port_available = $using:port_available
        If($node.port){
            $node.port | foreach {
                $port = $_
                $portResult = Test-Connection -ComputerName $node.ip -TcpPort $port -ErrorAction SilentlyContinue
                $portStatus = $portResult ? 1 : 0
                New-PromMetric -MetricDesc $port_available -Value $portStatus -Labels $node.name,$node.ip,$port -ErrorAction Stop
            }
        }

    } -ThrottleLimit 6

    # Output data to Prometheus
    New-PromOutput -Metrics $results
}