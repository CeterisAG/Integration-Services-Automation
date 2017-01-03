﻿$ModulePath = "D:\Users\DBR\Projects\Powershell\Cisa\CIsa"
$ConfigPath = "$($ModulePath)\CIsa.config.simple.xml"

Import-Module $ModulePath -Verbose -Force
$Config = ([xml](Get-Content -Path $Path -ErrorAction Stop)).Config


[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Management.IntegrationServices") | Out-Null;
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection $Config.General.SqlConnectionString
$IntegrationServices = New-Object "Microsoft.SqlServer.Management.IntegrationServices.IntegrationServices" $SqlConnection


Foreach($ConfigFolder in $Config.SSISDB.Folders.Folder){
    $Folder = Get-CIsaFolder  -IntegrationServicesObject $IntegrationServices -FolderName $ConfigFolder.Name -Verbose
    Remove-CIsaFolder -Folder $Folder -Verbose
}