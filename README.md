# Powershell
Implements some handy features for git and powershell. These are the following cmdlets added:
- reload: Restarts your current powershell session which is useful when you want to reload your current profile settings (profile.ps1).
- gpp: Runs g++ with a set of flags useful for debugging.
- git_account: Displays the currently logged in git account.
- git_login: Used to log in to a new git account.

# How to use
Locate your current powershell profile by typing $Profile.CurrentUserAllHosts in powershell. Then open that profile.ps1 file in your text editor of choice. Paste the contents of ps_git.ps1 in profile.ps1 and that should be all.
