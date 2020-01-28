#requires -version 5
<#
.SYNOPSIS
  <Overview of script>
.DESCRIPTION
  <Brief description of script>
.PARAMETER <Parameter_Name>
  <Brief description of parameter input required. Repeat this attribute if required>
.INPUTS
  <Inputs if any, otherwise state None>
.OUTPUTS Log File
  The script log file stored in C:\Windows\Temp\<name>.log
.NOTES
  Version:        1.0
  Author:         <Name>
  Creation Date:  <Date>
  Purpose/Change: Initial script development
.EXAMPLE
  <Example explanation goes here>
  
  <Example goes here. Repeat this attribute for more than one example>
#>

#---------------------------------------------------------[Script Parameters]------------------------------------------------------

Param (
  #Script parameters go here
)

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = 'SilentlyContinue'

# Get Script execute directory and script name
$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
$ScriptName = $MyInvocation.MyCommand.Name

#Log File Info
$LogName = "$ScriptName.log"
$LogFile = Join-Path -Path $ScriptDir -ChildPath $LogName

#----------------------------------------------------------[Declarations]----------------------------------------------------------

#Script Version
$ScriptVersion = '1.0'

#Set exitcode on successful run
$ExitCode = 0

#-----------------------------------------------------------[Functions]------------------------------------------------------------

<#
Function <FunctionName> {
  Param ()
  Begin {
    Write-Log -Entry "<description of what is going on>..."
  }
  Process {
    Try {
      <code goes here>
    }
    Catch {
      Write-Log -Entry $_.Exception
      Break
    }
  }
  End {
    If ($?) {
      Write-Log -Entry "Completed Successfully."
    }
  }
}
#>

function Write-Log {
    param (
        [Parameter(Mandatory=$False, Position=0)]
        [String]$Entry
    )

    "$(Get-Date -Format 'dd-MM-yyyy HH:mm:ss.fff') $Entry" | Out-File -FilePath $LogFile -Append
}

#-----------------------------------------------------------[Execution]------------------------------------------------------------

Write-Log -Entry "Script $ScriptName started on $(Get-Date -Format 'dddd, MMMM dd, yyyy')."


#Script Execution goes here


Write-Log -Entry "Script $ScriptName ended ($ExitCode)."
