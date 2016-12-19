﻿<#

.SYNOPSIS
Removes a project from a folder.

.DESCRIPTION
Removes a project from a folder.

.NOTES
TBD Removes Enironments first

.EXAMPLE
Remove-CIsaProject -Folder (Get-CIsaFolder -IntegrationServicesObject $IntegrationServices -FolderName "FolderName") -ProjectName "test"

#>
function Remove-CIsaProject
{
    [cmdletBinding()]
    param
    (
    	# Folder object
		[Parameter(Mandatory=$TRUE)]
		[Microsoft.SqlServer.Management.Sdk.Sfc.SfcInstance]$Folder,

        # Name of the project, wich should be removed
        [Parameter(Mandatory=$TRUE)]
        [string]$ProjectName


    )
    Begin{
        $StartTime = Get-Date -UFormat "%T"
        Write-Verbose -Message "$($StartTime) - Start Function $($MyInvocation.MyCommand)"
    }

    Process{
        $Project = $Folder.Projects[$ProjectName]
        if($Project){
            Write-Verbose -Message "Project $($Project.Name) will be removed"
            $Project.Drop()
        }else{
            Write-Verbose -Message "Project does not exist"
        }
    }

    End{
        $EndTime = Get-Date -UFormat "%T"
        $Timespan = NEW-TIMESPAN -Start $StartTime -End $EndTime
        Write-Verbose -Message "Finished $($EndTime) with $($Timespan.TotalSeconds) seconds"
    }


}

