# Starup Programs

# Starship - a prompt engine in rust
Invoke-Expression (&starship init powershell)

# PSReadline - bash inspired readline implementation
Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key ctrl+j -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key ctrl+k -Function HistorySearchForward
$PSReadLineOptions = @{
  HistoryNoDuplicates = $true
  HistorySearchCursorMovesToEnd = $true
  PredictionSource = "HistoryAndPlugin"
  PredictionViewStyle = "ListView"
  BellStyle = "None"
}
Set-PSReadLineOption @PSReadLineOptions

# Terminal-Icons - icons for files in ls
Import-Module -Name Terminal-Icons

# Zoxide - directory jumper
Invoke-Expression (& { (zoxide init powershell | Out-String) })

################################################################################

# Aliases

# bartib
Set-Alias b bartib
Set-Alias bl Bartib-Last
Set-Alias bcan Bartib-Cancel
Set-Alias bcon Bartib-Continue
Set-Alias bcur Bartib-Current
Set-Alias bedit Bartib-Edit
Set-Alias bla Bartib-Last
Set-Alias bli Bartib-List
Set-Alias bproj Bartib-Projects
Set-Alias brep Bartib-Report
Set-Alias bnew Bartib-Start
Set-Alias bstop Bartib-Stop
Set-Alias awesome Open-Sort-Awesome-Lists

# git
Set-Alias g git

# neovim
Set-Alias v nvim
Set-Alias vw Open-Vimwiki

# CD Home
Set-Alias ~ Go-Home

# CD to parent directory
Set-Alias .. Go-To-Parent-Directory

# Nvim current directory
Set-Alias vh Nvim-Here

# Edit Powershell Config
Set-Alias e Explore-Here

Set-Alias conf Edit-Configs

################################################################################

# Fuctions

function Explore-Here
{
  explorer .
}

function Open-Vimwiki
{
  nvim -c VimwikiIndex
}

function Go-Home
{
  cd ~
}

function Go-To-Parent-Directory
{
  cd ..
}

function Nvim-Here
{
  nvim .
}

function Bartib-Last
{
  bartib last
}

function Bartib-Cancel
{
  bartib cancel
}
# TODO: How to overload continue function so we can continue on a specific number
# maybe make the script use the index pick thing with gum
function Bartib-Continue
{ bartib continue 
}
function Bartib-Current
{ bartib current 
}
function Bartib-Edit
{ bartib edit 
}
function Bartib-Last
{ bartib last 
}
function Bartib-List
{ bartib list 
}
function Bartib-Projects
{ bartib projects 
}
function Bartib-Report
{ bartib report 
}
function Bartib-Start
{ bartib start 
}
function Bartib-Stop
{ bartib stop 
}

# TODO: implement this
function Edit-Configs
{
  param(
    [Parameter()]
    $program
  )
  Write-Output($program)
  $selection = "Neovim", "Powershell", "Starship", "MPV" | gum filter --placeholder "Pick a program"

  switch ($selection)
  {
    "Neovim"
    { 
      Set-Location C:\Users\lucas\AppData\Local\nvim
      Nvim-Here
    }
    "Powershell"
    { 
      Set-Location C:\Users\lucas\Documents\PowerShell
      nvim .\Microsoft.PowerShell_profile.ps1
    }
    "Starship"
    { 
      #Set-Location CC:\Users\lucas\.config
      nvim C:\Users\lucas\.config\starship.toml
    }
    "MPV"
    { 
      Set-Location C:\Users\lucas\AppData\Roaming\mpv
      nvim mpv.conf
    }
    Default
    {
    }
  }
}

function Open-Sort-Awesome-Lists
{
  $token = "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"
  $file_name = gum input --placeholder "Filename"
  $file_name += ".md"
  $url = gum input --placeholder "URL"
  # sort-awesome-lists -t="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" -o="awesome-go-sorted.md" https://raw.githubusercontent.com/avelino/awesome-go/master/README.md
  # sort-awesome-lists -t={$token} -o={$file_name} $url
  # Start-Process -FilePath "sort-awesome-lists" -ArgumentList "-t={$token} -o={$file_name} $url"
  # Write-Output("-t=$token -o=$file_name $url")
  Start-Process -FilePath "sort-awesome-lists" -ArgumentList "-t=`"$token`" -o=`"$file_name`" $url" -NoNewWindow

}


function mcd
{
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)]
    $Path
  )

  New-Item -Path $Path -ItemType Directory

  Set-Location -Path $Path
}

Import-Module Az.Tools.Predictor
Set-PSReadLineOption -PredictionSource HistoryAndPlugin


$env:BARTIB_FILE = 'C:\Users\lucas\bartib\activities.bartib'
$env:EDITOR = 'nvim'
