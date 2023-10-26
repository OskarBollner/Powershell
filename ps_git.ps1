
<#
############ Basic commands ##############
generate ssh: ssh-keygen -o -t rsa -b 4096
get key: cat ~/.ssh/id_rsa.pub
#>



## Runs g++ with flags ##

function g++_with_flags 
{
    g++ -std=c++17 -Wall -Wextra -pedantic -Weffc++ -Wold-style-cast -Woverloaded-virtual -fmax-errors=3 -g $args
}
    
    Set-Alias -Name gpp -Value g++_flags
    
    
    ## Reloads Powershell ##
function Invoke-PowerShell 
{
        powershell –nologo
        Invoke-PowerShell
}

function Restart-PowerShell 
{
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

    ## Displays current logged in git account ##
function git_account
{   
    Write-Host "You are currently logged in as: " -Foregroundcolor cyan
    git config --global user.name
    git config --global user.email
}

    ## Login to different git account ##
function git_login
{
    $name = $(Write-Host "Username: " -Foregroundcolor magenta -NoNewLine ;Read-Host)
    while (-not($name))
    {
        Write-Host "Please enter a valid name!" -ForegroundColor red
        $name = $(Write-Host "Username: " -Foregroundcolor magenta -NoNewLine ;Read-Host)
    }
    git config --global user.name $name

    $email = $(Write-Host "Email: " -Foregroundcolor magenta -NoNewLine ;Read-Host)
    while (-not($email))
    {
        Write-Host "Please enter a valid email!" -ForegroundColor red
        $email = $(Write-Host "Email: " -Foregroundcolor magenta -NoNewLine ;Read-Host)
    }
    git config --global user.email $email
}
    
    
    ## Imports posh-git ##
    Import-Module posh-git
    