# Prompt
Import-Module oh-my-posh
#oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression
# Set-PoshPrompt Paradox
Set-PoshPrompt spaceship

# Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Set-PSReadLineKeyHandler -Key 'Ctrl+j' -Function NextHistory
Set-PSReadLineKeyHandler -Key 'Ctrl+k' -Function PreviousHistory

# FuzzyFinder
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias vim nvim
Set-Alias v nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
# Set-Alias l lfcd

# Open lfcd
Set-PSReadLineKeyHandler -Chord Ctrl+o -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('l.ps1')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

# For LF File Manager
$env:CGO_ENABLED = '0'
$env:GO111MODULE = 'on'

