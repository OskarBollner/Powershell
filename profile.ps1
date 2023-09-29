
<#
############ Basic commands ##############
generate ssh: ssh-keygen -o -t rsa -b 4096
get key: cat ~/.ssh/id_rsa.pub
#>



## Runs g++ with flags ##

function g++_flags {g++ -std=c++17 -Wall -Wextra -pedantic -Weffc++ -Wold-style-cast -Woverloaded-virtual -fmax-errors=3 -g $args[0]}

Set-Alias -Name gpp -Value g++_flags


## Reloads Powershell ##
function Invoke-PowerShell {
    powershell –nologo
    Invoke-PowerShell
}

function Restart-PowerShell {
    if ($host.Name -eq 'ConsoleHost') {
        exit
    }
    Write-Warning 'Only usable while in the PowerShell console host'
}

Set-Alias –Name 'reload' –Value 'Restart-PowerShell'

$parentProcessId = (Get-WmiObject Win32_Process –Filter "ProcessId=$PID").ParentProcessId
$parentProcessName = (Get-WmiObject Win32_Process –Filter "ProcessId=$parentProcessId").ProcessName

if ($host.Name -eq 'ConsoleHost') {
    if (-not($parentProcessName -eq 'powershell.exe')) {
        Invoke-PowerShell
    }
}


## Displays current git username or change if argument != null ##
function gcun {git config --global user.name $args[0]}

Set-Alias -Name acc_name -Value gcun


## Displays current git email or change if argument != null ##
function gcue {git config --global user.email $args[0]}

Set-Alias -Name acc_email -Value gcue


## Imports posh-git ##
Import-Module posh-git
