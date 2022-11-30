### Env
$Env:PWSHCONF = 'C:\Users\GQ6381\.powershell\'
$Env:PATH += ';C:\Users\GQ6381\AppData\Roaming\vim\vim82;C:\Users\GQ6381\bin\;C:\Users\GQ6381\.krew\bin;C:\Program Files\Git\usr\bin;C:\Users\GQ6381\AppData\Roaming\Python\Python39\Scripts\'
$Env:VAGRANT_DEFAULT_PROVIDER="virtualbox"
$Env:DIRENV_CONFIG='C:\Users\GQ6381\bin\'
$Env:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
$Env:REQUESTS_CA_BUNDLE="$Env:PWSHCONF\ca-bundle.crt"



$default_aliases = "ls", "curl"
foreach ($alias in $default_aliases) {
  if ($(Get-Alias -Name $alias -erroraction 'SilentlyContinue')) {
    Remove-Item alias:$alias
  }

}

### Jump

Import-Module ZLocation

### Git

Import-Module Posh-Git

### Aliases
# Import-Module git-aliases -DisableNameChecking
Set-Alias -Name k -Value "kubectl.exe"

Set-Alias -Name j -Value "z"

### Custom Functions
. "$Env:PWSHCONF\functions.ps1"

### Source kubectl autocomplete
. "$Env:PWSHCONF\kubectl_autocomplete.ps1"

### Source chezmoi autocomplete
. "$Env:PWSHCONF\chezmoi_autocomplete.ps1"

### Chocolatey
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

###################
### Init Prompt

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
# (@(& 'C:/Users/GQ6381/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='C:\Users\GQ6381\.powershell\agnoster.omp.json' --print) -join "`n") | Invoke-Expression

Invoke-Expression (&starship init powershell)
