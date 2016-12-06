﻿<#

.SYNOPSIS
TBD

.DESCRIPTION
TBD

.NOTES
Version 0.01
Author Dennis Bretz
#>
function Remove-CSSISDBProject
{
    [cmdletBinding()]
    param
    (
    	# TBD
		[Parameter(Mandatory=$TRUE)]
		[Microsoft.SqlServer.Management.Sdk.Sfc.SfcInstance]$Folder,

        # TBD
        [Parameter(Mandatory=$TRUE)]
        [string]$ProjectName


    )
    Begin{}

    Process{
        $Project = $Folder.Projects[$ProjectName]
        if($Project){
            Write-Verbose -Message "Project $($Project.Name) will be removed"
            $Project.Drop()
        }else{
            Write-Verbose -Message "Project does not exist"
        }
    }

    End{}


}

