﻿<#

.SYNOPSIS
TBD

.DESCRIPTION
TBD

.NOTES
#>
function Remove-CIsaEnviroment
{
    [cmdletBinding()]
    param
    (
    	# TBD
		[Parameter(Mandatory=$TRUE)]
		[Microsoft.SqlServer.Management.Sdk.Sfc.SfcInstance]$Folder,

        # TBD
        [Parameter(Mandatory=$TRUE)]
        [string]$EnviromentName


    )
    Begin{}

    Process{
        $Enviroment = $Folder.Environments[$EnviromentName]
        if($Project){
            Write-Verbose -Message "Enviroment $($Enviroment.Name) will be removed"
            $Enviroment.Drop()
        }else{
            Write-Verbose -Message "Enviroment $($Enviroment.Name) does not exist"
        }
    }

    End{}


}
