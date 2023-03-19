[CmdletBinding()]
Param (
    [string[]]$ModuleNames = @(
"PSWindowsUpdate",
    "Az.Accounts",
    "DellBIOSProvider",
    "PowerShellGet",
    "PackageManagement",
    "Az.Storage",
    "Az.Resources",
    "Az.KeyVault",
    "TeamViewerPS",
    "RunAsUser",
    "Get-WindowsAutoPilotInfo",
    "Az.Compute",
    "Az.Automation",
    "Az.Advisor",
    "Az.Billing",
    "Az.ApiManagement",
    "Az.Aks",
    "Az.AnalysisServices",
    "Az.ApplicationInsights",
    "Az.Network",
    "Az.Batch",
    "Az.Cdn",
    "Az.CognitiveServices",
    "Az.DataFactory",
    "Az.ContainerInstance",
    "Az.ContainerRegistry",
    "Az.Monitor",
    "Az.AppConfiguration",
    "Az.DataLakeStore",
    "Az.EventHub",
    "Az.DataLakeAnalytics",
    "Az.DataBoxEdge",
    "Az.Dns",
    "Az.EventGrid",
    "Az.DevTestLabs",
    "Az.DeploymentManager",
    "Az.Sql",
    "Az.OperationalInsights",
    "Az.FrontDoor",
    "Az.DesktopVirtualization",
    "Az.Websites",
    "Az.HDInsight",
    "Az.IotHub",
    "Az.Functions",
    "Az.LogicApp",
    "Az.Databricks",
    "Az.ServiceBus",
    "Az.RecoveryServices",
    "Az.PolicyInsights",
    "Az.HealthcareApis",
    "Az.MachineLearning",
    "Az.MarketplaceOrdering",
    "Az.DataShare",
    "Az.RedisCache",
    "Az.Media",
    "Az.ManagedServices",
    "Az.StorageSync",
    "Az.NotificationHubs",
    "Az.PowerBIEmbedded",
    "Az.CloudService",
    "Az.ServiceFabric",
    "Az.Maintenance",
    "Az.SignalR",
    "Az.Relay",
    "Az.TrafficManager",
    "Az.PrivateDns",
    "Az.StreamAnalytics",
    "Az",
    "Az.Kusto",
    "Az.SqlVirtualMachine",
    "Az.CosmosDB",
    "Az.Support",
    "Az.Attestation",
    "Az.Migrate",
    "Az.RedisEnterpriseCache",
    "Az.ResourceMover",
    "Az.Security",
    "SqlServer",
    "Az.SecurityInsights",
    "Az.Synapse",
    "Az.ManagedServiceIdentity",
    "powershell-yaml",
    "Az.StackHCI",
    "Az.MySql",
    "Az.PostgreSql",
    "PendingReboot",
    "AzureRM.profile",
    "Az.ConfidentialLedger",
    "PolicyFileEditor",
    "Az.DataProtection",
    "7Zip4Powershell",
    "Posh-SSH",
    "Carbon",
    "AWS.Tools.Common",
    "HPCMSL",
    "ExchangeOnlineManagement",
    "Azure.Storage",
    "CredentialManager",
    "AzureAD",
    "LSUClient"),
    [string]$LogPath = "$env:TEMP\Install-Modules.log"
)

# Create a log file to record installation progress and errors
$LogFile = New-Item -ItemType File -Path $LogPath -Force

# Update PowerShellGet and PackageManagement
Write-Progress -Activity "Updating PowerShellGet and PackageManagement" -Status "Please wait" -PercentComplete 0
Install-Module -Name PowerShellGet -Force -MinimumVersion 2.2.5 -Scope CurrentUser -AllowClobber -Repository PSGallery -Verbose:$false -ErrorAction Continue 2>&1 | Out-File -Append -FilePath $LogFile
Install-Module -Name PackageManagement -Force -MinimumVersion 1.4.6 -Scope CurrentUser -AllowClobber -Repository PSGallery -Verbose:$false -ErrorAction Continue 2>&1 | Out-File -Append -FilePath $LogFile

# Install or update specified modules
ForEach ($ModuleName in $ModuleNames) {
    Write-Progress -Activity "Installing/Updating $ModuleName" -Status "Please wait" -PercentComplete 0
    Try {
        If (Get-Module -Name $ModuleName -ListAvailable) {
            Update-Module -Name $ModuleName -Force -Verbose:$false -ErrorAction Continue 2>&1 | Out-File -Append -FilePath $LogFile
        } Else {
            Install-Module -Name $ModuleName -Force -Scope CurrentUser -AllowClobber -Repository PSGallery -Verbose:$false -ErrorAction Continue 2>&1 | Out-File -Append -FilePath $LogFile
        }
    } Catch {
        Write-Warning "Installation/Update of $ModuleName failed. See $LogPath for more information."
        Write-Output $_.Exception.Message | Out-File -Append -FilePath $LogFile
    }
}

Write-Host "Installation of specified modules is complete. See $LogPath for details."

