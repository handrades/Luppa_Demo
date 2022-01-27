@{
    App = @{
        Name = 'Luppa Demo'
        Version = '0.0.1'
    }
    Docker = @(
        @{
            Name = 'grafana'
            Ports = @(
                '3000:3000'
            )
            Tags = @(
                'prod'
            )
        }
        @{
            Name = 'prometheus'
            Ports = @(
                '9090:9090'
            )
            Tags = @(
                'prod'
            )
        }
        @{
            Name = 'pwsh'
            Ports = @(
                '5000:5000'
            )
            Tags = @(
                'prod'
            )
        }
        @{
            Name = 'node-red'
            Ports = @(
                '1880:1880'
            )
            Tags = @(
                'prod'
            )
        }
        @{
            Name = 'influxbd'
            Ports = @(
                '8086:8086'
            )
            Tags = @(
                'prod'
            )
        }
        @{
            Name = 'grafana'
            Ports = @(
                '3001:3000'
            )
            Tags = @(
                'dev'
            )
        }
        @{
            Name = 'prometheus'
            Ports = @(
                '9091:9090'
            )
            Tags = @(
                'dev'
            )
        }
        @{
            Name = 'pwsh'
            Ports = @(
                '5001:5000'
            )
            Tags = @(
                'dev'
            )
        }
        @{
            Name = 'node-red'
            Ports = @(
                '1881:1880'
            )
            Tags = @(
                'dev'
            )
        }
        @{
            Name = 'influxbd'
            Ports = @(
                '8087:8086'
            )
            Tags = @(
                'dev'
            )
        }
    )
    AllNodes = @(
        @{
            Name = 'Internet'
            IP = '8.8.8.8'
            Port = $null
            Description = 'DNS internet'
            Mac = $null
            Tags = @(
                'all'
                'Infrastructure'
                'Internet'
            )
        }
        @{
            Name = 'HK-ISP'
            IP = '192.168.1.1'
            Port = 80
            Description = 'MetroCable modem'
            Mac = '94:e3:ee:41:0d:e2'
            Tags = @(
                'all'
                'Infrastructure'
                'ISP'
                'Web'
            )
        }
        @{
            Name = 'HK-QNAP'
            IP = '10.10.2.20'
            Port = 443
            Description = 'QNAP LoadBalancer'
            Mac = $null
            Tags = @(
                'all'
                'Infrastructure'
                'Storage'
                'Web'
            )
            DoNotPing = $true
        }
        @{
            Name = 'HK-QNAP1'
            IP = '10.10.2.21'
            Port = @(22,443)
            Description = 'Almacenamiento QNAP'
            Mac = '00:08:9b:e2:c3:d0'
            Tags = @(
                'all'
                'Infrastructure'
                'Storage'
                'Web'
            )
        }
        @{
            Name = 'HK-QNAP2'
            IP = '10.10.2.22'
            Port = @(22,443)
            Description = 'Almacenamiento QNAP'
            Mac = '00:08:9b:e2:c3:d1'
            Tags = @(
                'all'
                'Infrastructure'
                'Storage'
                'Web'
            )
        }
        @{
            Name = 'HK-Hyperv1'
            IP = '10.10.2.31'
            Port = @(3389,5900)
            Description = 'Hypervisor Hyper-V'
            Mac = 'd8:9e:f3:7c:16:b2'
            Tags = @(
                'all'
                'Infrastructure'
                'Host'
            )
        }
        @{
            Name = 'HK-Master'
            IP = '10.10.2.101'
            Port = 22
            Description = 'Kubernetes Master'
            Mac = '00:15:5d:06:e3:0d'
            Tags = @(
                'all'
                'Infrastructure'
                'VM'
                'Kubernetes'
                'SSH'
            )
        }
        @{
            Name = 'HK-Node1'
            IP = '10.10.2.111'
            Port = @(22,53,8000)
            Description = 'Kubernetes Worker'
            Mac = '00:15:5d:06:e3:0e'
            Tags = @(
                'all'
                'Infrastructure'
                'VM'
                'Kubernetes'
                'SSH'
            )
        }
        @{
            Name = 'HK-Node2'
            IP = '10.10.2.112'
            Port = 22
            Description = 'Kubernetes Worker'
            Mac = '00:15:5d:06:e3:0f'
            Tags = @(
                'all'
                'Infrastructure'
                'VM'
                'Kubernetes'
                'SSH'
            )
        }
        @{
            Name = 'HK-Node3'
            IP = '10.10.2.113'
            Port = 22
            Description = 'Kubernetes Worker'
            Mac = '00:15:5d:06:e3:10'
            Tags = @(
                'all'
                'Infrastructure'
                'VM'
                'Kubernetes'
                'SSH'
            )
        }
        @{
            Name = 'HK-AppleTV'
            IP = '10.10.3.11'
            Port = $null
            Description = $null
            Mac = '50:32:37:b6:25:91'
            Tags = @(
                'all'
                'Client'
                'IOT'
            )
        }
        @{
            Name = 'HK-Lutron'
            IP = '10.10.3.12'
            Port = $null
            Description = $null
            Mac = '50:8c:b1:ce:bc:7a'
            Tags = @(
                'all'
                'Client'
                'IOT'
                'Luces'
            )
        }
        @{
            Name = 'HK-Wireless'
            IP = '10.10.6.2'
            Port = 80
            Description = 'Access Point TP Link'
            Mac = '50:d4:f7:77:4f:f4'
            Tags = @(
                'all'
                'Infrastructure'
                'Wireless'
                'Web'
            )
        }
        @{
            Name = 'HK-Hektop'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = 'e4:a7:a0:37:55:14'
            Tags = @(
                'all'
                'Client'
                'Laptop'
            )
        }
        @{
            Name = 'HK-CellPink'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = '0a:29:ce:3f:d1:ec'
            Tags = @(
                'all'
                'Client'
                'CellPhone'
            )
        }
        @{
            Name = 'HK-XboxOne'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = '28:18:78:e9:68:ec'
            Tags = @(
                'all'
                'Client'
            )
        }
        @{
            Name = 'HK-XView1'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = '9c:2f:4e:05:d6:5d'
            Tags = @(
                'all'
                'Client'
            )
        }
        @{
            Name = 'HK-iPadAlex'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = 'b6:ec:db:e1:f6:13'
            Tags = @(
                'all'
                'Client'
                'iPad'
            )
        }
        @{
            Name = 'HK-CellAlex'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = '2a:a1:f1:9a:7c:bb'
            Tags = @(
                'all'
                'Client'
                'CellPhone'
            )
        }
        @{
            Name = 'HK-CellHektop'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = '1e:62:0c:3b:e1:34'
            Tags = @(
                'all'
                'Client'
                'CellPhone'
            )
        }
        @{
            Name = 'HK-Echo'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = '1c:4d:66:9c:a0:fc'
            Tags = @(
                'all'
                'Client'
                'Alexa'
            )
        }
        @{
            Name = 'HK-TVSamsung65'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = '84:c0:ef:70:51:a2'
            Tags = @(
                'all'
                'Client'
                'TV'
                'Samsung'
            )
        }
        @{
            Name = 'HK-CamCocina'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = '7c:78:b2:38:ba:86'
            Tags = @(
                'all'
                'Client'
                'IOT'
                'Camara'
            )
        }
        @{
            Name = 'HK-CamVentana'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = '7c:78:b2:36:d1:22'
            Tags = @(
                'all'
                'Client'
                'IOT'
                'Camara'
            )
        }
        @{
            Name = 'HK-iRobot'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = '50:14:79:25:3f:86'
            Tags = @(
                'all'
                'Client'
                'IOT'
                'ElectroDomestico'
            )
        }
        @{
            Name = 'HK-Lavadora'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = '24:e8:53:f7:7d:5a'
            Tags = @(
                'all'
                'Client'
                'IOT'
                'ElectroDomestico'
            )
        }
        @{
            Name = 'HK-Refrigerador'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = '40:2f:86:c4:ee:2b'
            Tags = @(
                'all'
                'Client'
                'IOT'
                'ElectroDomestico'
            )
        }
        @{
            Name = 'HK-Secadora'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = '24:e8:53:f7:7a:3f'
            Tags = @(
                'all'
                'Client'
                'IOT'
                'ElectroDomestico'
            )
        }
        @{
            Name = 'HK-TVWestinghouse55'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = 'f8:4f:ad:06:28:04'
            Tags = @(
                'all'
                'Client'
                'TV'
                'WestingHouse'
            )
        }
        @{
            Name = 'HK-Lavavajilla'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = 'dc:03:98:3e:d2:b1'
            Tags = @(
                'all'
                'Client'
                'IOT'
                'ElectroDomestico'
            )
        }
        @{
            Name = 'HK-TVVizio50'
            IP = 'DHCP'
            Port = $null
            Description = $null
            Mac = 'c4:1c:ff:c4:e3:5a'
            Tags = @(
                'all'
                'Client'
                'TV'
                'Vizio'
            )
        }
        @{
            Name = 'HK-FG'
            IP = '10.10.255.1'
            Port = @(22,443)
            Description = 'Firewall 80C'
            Tags = @(
                'all'
                'Infrastructure'
                'Firewall'
                'SSH'
                'Web'
            )
        }
        @{
            Name = 'HK-SWCore'
            IP = '10.10.255.11'
            Port = @(22,443)
            Description = 'Switch HPE 48 Puertos'
            Mac = 'd4:c9:ef:2d:85:c0'
            Tags = @(
                'all'
                'Infrastructure'
                'Switch'
                'SSH'
                'Web'
            )
        }
        @{
            Name = 'HK-UPS'
            IP = '10.10.255.23'
            Port = 80
            Description = 'UPS Dell 1000W'
            Mac = 'd0:67:e5:ff:b6:40'
            Tags = @(
                'all'
                'Infrastructure'
                'UPS'
                'Web'
            )
        }
    )
    PLCs = @(
        @{
            Cell = '1'
            IP = '10.107.201.11'
            Site = 'Silao'
            Tag= @(
                'sup_name'
                'Current_recipe_name'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '1'
            IP = '10.107.12.217'
            Site = 'Silao'
            Tag= @(
                #Left
                'MES.AIP_CNT[0]'
                'MES.CNT[0].ACC'
                'MES.ID[0]'
                #Right
                'MES.AIP_CNT[1]'
                'MES.CNT[1].ACC'
                'MES.ID[1]'
            )
        }
        @{
            Cell = '1'
            IP = '10.107.12.251'
            Site = 'Silao'
            Tag= @(
                #Left
                'MES.AIP_CNT[0]'
                'MES.CNT[0].ACC'
                'MES.ID[0]'
                #Right
                'MES.AIP_CNT[1]'
                'MES.CNT[1].ACC'
                'MES.ID[1]'
            )
        }
        @{
            Cell = '1'
            IP = '10.107.12.250'
            Site = 'Silao'
            Tag= @(
                #Left
                'N7:132'
                'C5:100.ACC'
                'N7:120'
                #Right
                'N7:142'
                'C5:101.ACC'
                'N7:121'
            )
        }
        @{
            Cell = '1'
            IP = '10.107.12.248'
            Site = 'Silao'
            Tag= @(
                #Left
                'N7:132'
                'C5:100.ACC'
                'N7:120'
            )
        }
        @{
            Cell = '1'
            IP = '10.107.12.153'
            Site = 'Silao'
            Tag= @(
                #Left
                'N7:132'
                'C5:100.ACC'
                'N7:120'
            )
        }
        @{
            Cell = '1'
            IP = '10.107.12.151'
            Site = 'Silao'
            Tag= @(
                #Right
                'N7:132'
                'C5:100.ACC'
                'N7:120'
            )
        }
        @{
            Cell = '2'
            IP = '10.107.202.11'
            Site = 'Silao'
            Tag= @(
                'ST41:0'
                'N7:25'
                'N73:0'
            )
        }
        @{
            Cell = '4'
            IP = '10.107.204.11'
            Site = 'Silao'
            Tag= @(
                'sup_name'
                'Current_recipe_name'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '11'
            IP = '10.107.211.13'
            Site = 'Silao'
            Tag= @(
                'sup_name'
                'recipe_working.recipe_name'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '12'
            IP = '10.107.212.11'
            Site = 'Silao'
            Tag= @(
                'current_recipe'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '21'
            IP = '10.107.221.11'
            Site = 'Silao'
            Tag= @(
                'sup_name'
                'Current_recipe'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '22'
            IP = '10.107.222.11'
            Site = 'Silao'
            Tag= @(
                'SET_WORK_ORDER_QTY_2XP'
                'SUMA_MODELO_2XP_XS_UNDERBODY'
                'SET_WORK_ORDER_QTY_FIT'
                'SUMA_MODELO_FIT'
                'SUMA_MODELO_CX3'
                'WORK_ORDER_QTY_CX3'
                'SET_WORK_ORDER_QTY_INFINITI_QX50_19'
                'SUMA_MODELO_INFINITI_QX50_19'
                'SET_WORK_ORDER_QTY_MAZDA3_BDTS'
                'SUMA_MODELO_MAZDA3_BDTS'
                'FIT_State'
                'Under2xp_State'
                'CX3_State'
                'InfinityQx50_State'
                'Mazda3_BDTS_State'
                'Current_recipe'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '26'
            IP = '10.107.226.11'
            Site = 'Silao'
            Tag= @(
                'sup_name'
                'Current_recipe'
                'NOCYCLEMIN'
            )
        }
        @{
            Cell = '26A'
            IP = '10.107.226.17'
            Description = 'LH'
            Site = 'Silao'
            Tag= @(
                'STATUS_STATES'
                'NOCYCLEMIN'
            )
        }
        @{
            Cell = '26A'
            IP = '10.107.226.18'
            Site = 'Silao'
            Description = 'RH'
            Tag= @(
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '31'
            IP = '10.107.231.11'
            Site = 'Silao'
            Tag= @(
                'SET_WORK_ORDER_QTY_NISS_OUTER'
                'SUMA_MODELO_NISS_OUTER'
                'SET_WORK_ORDER_QTY_NISS_HOOD_FRONTIER'
                'SUMA_MODELO_NISS_HOOD_FRONTIER'
                'SET_WORK_ORDER_QTY_NISS_HOOD_H60'
                'SUMA_MODELO_NISS_HOOD_H60'
                'SET_WORK_ORDER_QTY_M3_OUTER'
                'SUMA_MODELO_M3_OUTER'
                'SET_WORK_ORDER_QTY_M2_OUTER'
                'SUMA_MODELO_M2_OUTER'
                'SET_WORK_ORDER_QTY_2XP_OUTER_A000'
                'SUMA_MODELO_2XP_OUTER_A000'
                'SET_WORK_ORDER_QTY_M3_COWL'
                'SUMA_MODELO_M3_COWL'
                'SET_WORK_ORDER_QTY_L02D_COWL'
                'SUMA_MODELO_L02D_COWL'
                'SET_WORK_ORDER_QTY_NISSAN_OUTER_L02D'
                'SUMA_MODELO_NISSAN_OUTER_L02D'
                'SET_WORK_ORDER_QTY_NISSAN_OUTER_P02F'
                'SUMA_MODELO_NISSAN_OUTER_P02F'
                'SET_WORK_ORDER_QTY_NISSAN_HOOD_P02F'
                'SUMA_MODELO_NISSAN_HOOD_P02F'
                'SET_WORK_ORDER_QTY_MAZDA3_COVER'
                'SUMA_MODELO_MAZDA3_COVER'
                'SET_WORK_ORDER_QTY_M2_COWL'
                'SUMA_MODELO_M2_COWL'
                'NISS_OUTER_Status'
                'HOOD_FRONTIER_Status'
                'HOOD_H60_Status'
                'M3_OUTER_Status'
                'M2_OUTER_Status'
                'OUTER_2xp_A000_Status'
                'M3_COWL_Status'
                'L02D_COWL_Status'
                'OUTER_L02D_Status'
                'OUTER_P02F_Status'
                'HOOD_P02F_Status'
                'MAZDA3_COVER_Status'
                'sup_name'
                'recipe_working.recipe_name'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '32'
            IP = '10.107.232.11'
            Site = 'Silao'
            Tag= @(
                'sup_name'
                'Current_recipe'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '33'
            IP = '10.107.233.11'
            Site = 'Silao'
            Tag= @(
                'SET_WORK_ORDER_QTY_M3_HOOD_J59J'
                'SUMA_MODELO_M3_HOOD_J59J'
                'SET_WORK_ORDER_QTY_MAZDA3_J59W_COWL'
                'SUMA_MODELO_MAZDA3_J59W_COWL'
                'SET_WORK_ORDER_QTY_MAZDA3_J59W_WHEEL'
                'SUMA_MODELO_MAZDA3_J59W_WHEEL'
                'SET_WORK_ORDER_QTY_D_OUTER_J59W'
                'SUMA_MODELO_D_OUTER_J59W'
                'SET_WORK_ORDER_QTY_MAZDA3_J59W_HOOD'
                'SUMA_MODELO_MAZDA3_J59W_HOOD'
                'M3_HOOD_J59J_Status'
                'MAZDA3_J59W_COWL_Status'
                'M3_J59W_WHEEL_Status'
                'OUTER_J59W_Status'
                'J59W_HOOD_Status'
                'sup_name'
                'Current_recipe'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '41A'
            IP = '10.107.241.13'
            Site = 'Silao'
            Tag= @(
                'sup_name'
                'Current_recipe'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '41'
            IP = '10.107.241.16'
            Site = 'Silao'
            Tag= @(
                'VDI_Status'
                'WORK_ORDER_QTY_VDI'
                'SUMA_MODELO_VDI'
                'M2DI_Status'
                'WORK_ORDER_QTY_M2DI'
                'SUMA_MODELO_M2DI'
                'WORK_ORDER_QTY_DIP02F'
                'SUMA_MODELO_DIP02F'
            )
        }
        @{
            Cell = '41'
            IP = '10.107.241.17'
            Site = 'Silao'
            Tag= @(
                'sup_name'
                'Current_recipe'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '42'
            IP = '10.107.242.14'
            Site = 'Silao'
            Tag= @(
                'DIP02F_Status'
                'MZ3J59J_Status'
                'WORK_ORDER_QTY_MZ3J59J'
                'SUMA_MODELO_MZ3J59J'
                'TUNDRA_Status'
                'WORK_ORDER_QTY_TUNDRA'
                'SUMA_MODELO_TUNDRA'
            )
        }
        @{
            Cell = '42'
            IP = '10.107.242.15'
            Site = 'Silao'
            Tag= @(
                'sup_name'
                'Current_recipe'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '43A'
            IP = '10.107.243.12'
            Site = 'Silao'
            Tag= @(
                'Current_recipe'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '43'
            IP = '10.107.243.14'
            Site = 'Silao'
            Tag= @(
                'MZ3DI2019_Status'
                'WORK_ORDER_QTY_MZ3DI2019'
                'SUMA_MODELO_MZ3DI2019'
                'WORK_ORDER_QTY_MZCX3DI'
                'SUMA_MODELO_MZCX3DI'
                'MZCX3DI_Status'
                'WORK_ORDER_QTY_MZ3WINGS'
                'SUMA_MODELO_MZ3WINGS'
                'MZ3WINGS_Status'
            )
        }
        @{
            Cell = '43'
            IP = '10.107.243.15'
            Site = 'Silao'
            Tag= @(
                'sup_name'
                'Current_recipe'
                'NOCYCLEMIN'
                'STATUS_STATES'
            )
        }
        @{
            Cell = '1'
            IP = '10.105.201.11'
            Site = 'Valpo'
            Tag= @(
                'MDT_Recipe_Name'
                'MDT.NOCYCLEMIN'
                'MDT.NOCYCLESEG'
                'MDT.STATUS_STATES'
            )
        }
        @{
            Cell = '5'
            IP = '10.105.205.11'
            Site = 'Valpo'
            Tag= @(
                'MDT_Recipe_Name'
                'MDT.NOCYCLEMIN'
                'MDT.NOCYCLESEG'
                'MDT.STATUS_STATES'
            )
        }
        @{
            Cell = '6A'
            IP = '10.105.206.11'
            Site = 'Valpo'
            Tag= @(
                'N61:1'
                'ST64:0'
                'N61:0'
                'B60:2'
            )
        }
        @{
            Cell = '6B'
            IP = '10.105.206.14'
            Site = 'Valpo'
            Tag= @(
                'ST64:0'
                'N61:0'
                'N61:1'
                'B60:2'
            )
        }
        @{
            Cell = '7'
            IP = '10.105.207.11'
            Site = 'Valpo'
            Tag= @(
                'ST64:0'
                'N61:0'
                'N61:1'
                'B60:2'
            )
        }
        @{
            Cell = '8'
            IP = '10.105.208.11'
            Site = 'Valpo'
            Tag= @(
                'MDT.NOCYCLESEG'
                'MDT_Recipe_Name'
                'MDT.NOCYCLEMIN'
                'MDT.STATUS_STATES'
            )
        }
        @{
            Cell = '9'
            IP = '10.105.209.11'
            Site = 'Valpo'
            Tag= @(
                'MDT.NOCYCLESEG'
                'MDT_Recipe_Name'
                'MDT.NOCYCLEMIN'
                'MDT.STATUS_STATES'
            )
        }
        @{
            Cell = '10'
            IP = '10.105.210.11'
            Site = 'Valpo'
            Tag= @(
                'ST64:0'
                'N61:0'
                'N61:1'
                'B60:2'
            )
        }
        @{
            Cell = '11'
            IP = '10.105.211.11'
            Site = 'Valpo'
            Tag= @(
                'ST64:0'
                'N61:0'
                'N61:1'
                'B60:2'
            )
        }
        @{
            Cell = '12'
            IP = '10.105.212.11'
            Site = 'Valpo'
            Tag= @(
                'MDT.NOCYCLESEG'
                'MDT_Recipe_Name'
                'MDT.NOCYCLEMIN'
                'MDT.STATUS_STATES'
            )
        }
        @{
            Cell = '13'
            IP = '10.105.213.11'
            Site = 'Valpo'
            Tag= @(
                'MDT.NOCYCLESEG'
                'MDT_Recipe_Name'
                'MDT.NOCYCLEMIN'
                'MDT.STATUS_STATES'
            )
        }
        @{
            Cell = '14'
            IP = '10.105.214.11'
            Site = 'Valpo'
            Tag= @(
                'MDT_Recipe_Name'
                'MDT.NOCYCLEMIN'
                'MDT.NOCYCLESEG'
                'MDT.STATUS_STATES'
            )
        }
        @{
            Cell = '15'
            IP = '10.105.215.11'
            Site = 'Valpo'
            Tag= @(
                'MDT.NOCYCLESEG'
                'MDT_Recipe_Name'
                'MDT.NOCYCLEMIN'
                'MDT.STATUS_STATES'
            )
        }
        @{
            Cell = '16'
            IP = '10.105.216.11'
            Site = 'Valpo'
            Tag= @(
                'MDT.NOCYCLESEG'
                'MDT.NOCYCLEMIN'
                'MDT_Recipe_Name'
                'MDT.STATUS_STATES'
            )
        }
        @{
            Cell = '17'
            IP = '10.105.217.11'
            Site = 'Valpo'
            Tag= @(
                'MDT.NOCYCLESEG'
                'MDT_Recipe_Name'
                'MDT.NOCYCLEMIN'
                'MDT.STATUS_STATES'
            )
        }
        @{
            Cell = '18'
            IP = '10.105.218.11'
            Site = 'Valpo'
            Tag= @(
                'MDT.NOCYCLESEG'
                'MDT_Recipe_Name'
                'MDT.NOCYCLEMIN'
                'MDT.STATUS_STATES'
            )
        }
        @{
            Cell = '19'
            IP = '10.105.219.11'
            Site = 'Valpo'
            Tag= @(
                'MDT_Recipe_Name'
                'MDT.NOCYCLEMIN'
                'MDT.NOCYCLESEG'
                'MDT.STATUS_STATES'
            )
        }
        @{
            Cell = '20'
            IP = '10.105.220.11'
            Site = 'Valpo'
            Tag= @(
                'MDT.NOCYCLESEG'
                'MDT_Recipe_Name'
                'MDT.NOCYCLEMIN'
                'MDT.STATUS_STATES'
            )
        }
        @{
            Cell = '21'
            IP = '10.105.221.11'
            Site = 'Valpo'
            Tag= @(
                'MDT.NOCYCLESEG'
                'MDT_Recipe_Name'
                'MDT.NOCYCLEMIN'
                'MDT.STATUS_STATES'
            )
        }
    )
}
