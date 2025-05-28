# posh-git -----------------------------------------------------------------------------------------
Import-Module posh-git


# Prompt Styling-----------------------------------------------------------------------------------------
# Oh My Posh Prompt
# $omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
# oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# Terminal Icons-----------------------------------------------------------------------------------------
Import-Module -Name Terminal-Icons

# Zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

#PS ReadLine -----------------------------------------------------------------------------------------
Import-Module -Name PSReadLine
Set-PSReadLineOption -PredictionSource History 
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -HistorySavePath "C:\Users\Paul\Documents\PowerShell\PSReadLineHistory.txt"

#Fzf-----------------------------------------------------------------------------------------
Import-Module PSfzf
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' 
Set-PsFzfOption -PSReadLineChordReverseHistory 'Ctrl+r'

function fcd {
    # List directories recursively from the current directory
    $dir = Get-ChildItem -Directory -Recurse -ErrorAction SilentlyContinue |
           Select-Object -ExpandProperty FullName |
           fzf
    if ($dir) {
        Set-Location $dir
    }
}

#Fastfetch-----------------------------------------------------------------------------------------
if (-not $env:SKIP_FASTFETCH) {
    Fastfetch
  }


# Alias-----------------------------------------------------------------------------------------
Set-Alias -Name vim -Value nvim
Set-Alias cat bat
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias touch New-Item
#Set-Alias which Get-Command
# function which { (Get-Command $args[0] -ErrorAction SilentlyContinue).Source }
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
Set-Alias blender "C:\Program Files\Blender Foundation\Blender 4.0\blender.exe"
function EditTerminalSettings { vim "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" }





