#.\DevMachineSetup.ps1 -prepOS -tools -vs -winSettings

Param
(
    [Switch]
    $prepOS,

    [Switch]
    $tools,
     
    [Switch]
    $vs,
    
    [Switch]
    $winSettings,

    [Switch]
    $work


)

if( $prepOS ) 
{
    Set-ExecutionPolicy unrestricted
    Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

if( $work ) 
{
    choco install slack -y
   
   }
function ShowFileExtensions{
    Push-Location
    Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
    Set-ItemProperty . HideFileExt "0"
    Pop-Location
}

if( $winSettings ) {
    ShowFileExtensions
    choco install taskbar-never-combine -y -force
}



if( $tools ) {
    choco install -y googlechrome
    choco install -y 7zip
    choco install -y sysinternals
    choco install -y visualstudiocode
    choco install -y linqpad4
    
    #git
    choco install git.install -y
    choco install poshgit -y
    choco install gitextensions -y
    choco install kdiff3 -y
    
    choco install conemu -y

    
   
}

if( $vs ) {
    choco install -y visualstudiocode -y
    choco install visualstudio2017professional -y
    choco install resharper -y
}

