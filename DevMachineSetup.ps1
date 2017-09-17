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
    $winSettings

)

if( $prepOS ) 
{
    Set-ExecutionPolicy unrestricted
    Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

if( $winSettings ) {
    
    choco install taskbar-never-combine -y -force
}

if( $tools ) {
    choco install -y googlechrome
    choco install -y 7zip
    choco install -y sysinternals
    choco install -y visualstudiocode
    
    #git
    choco install git.install
    choco install poshgit
    choco install gitextensions
    
    choco install conemu

    
   
}

if( $vs ) {
    choco install -y visualstudiocode
    choco install visualstudio2017professional
}


