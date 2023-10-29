
if (!(Test-Path "c:\temp_msys2\msys2-x86_64-20231026.exe"))
{
    # URL to g++ download
    $url = "https://github.com/msys2/msys2-installer/releases/download/2023-10-26/msys2-x86_64-20231026.exe"
    $dest = New-Item -Path "c:\temp_msys2" -ItemType "directory" -Force

    # Download file
    Start-BitsTransfer -Source $url -Destination $dest

    & $dest\msys2-x86_64-20231026.exe

    Write-Host "Enter the following in the MSYS2 Terminal:" -ForegroundColor Magenta
    Write-Host "pacman -S --needed base-devel mingw-w64-ucrt-x86_64-toolchain `n" -ForegroundColor Gray

    $msys_path = $(Write-Host "Enter the saved location for msys64: (default is 'C:') " -Foregroundcolor magenta -NoNewLine ; Read-Host)
    
    if (-not($msys_path)) {$msys_path = "C:"}

    $user_path = (Get-ItemProperty HKCU:\Environment).PATH
    $newPath = $user_path + (";" + $msys_path + "\msys64\ucrt64\bin")
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
}


Set-Content -Path $PROFILE.CurrentUserAllHosts -Value (Get-Content "ps_git.ps1")