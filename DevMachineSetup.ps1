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
	Write-Host "Prepping OS Starting"
    Set-ExecutionPolicy unrestricted
    Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
	Write-Host "Prepping OS Complete"
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
	Write-Host "Configuring OS settings"
    ShowFileExtensions
    choco install taskbar-never-combine -y -force
	Write-Host "Configuring OS settings Complete"
}



if( $tools ) {
	Write-Host "Installing Tools"
    choco install -y googlechrome
    choco install -y 7zip
    choco install -y sysinternals
    choco install -y visualstudiocode
    choco install -y linqpad4
    choco install launchy -y
    
    #git
    choco install git.install -y
    choco install poshgit -y
    choco install gitextensions -y
    choco install kdiff3 -y
    choco install winmerge -y
    choco install gcloudsdk -y
    choco install kubernetes-cli -y
    choco install conemu -y
    choco install virtualbox -y
    choco install putty -y
    choco install dotnetcore-sdk -y
	Write-Host "Installing Tools Complete"
    
   
}

if( $vs ) {
    choco install -y visualstudiocode -y
    choco install visualstudio2017professional -y
    choco install resharper -y
}

