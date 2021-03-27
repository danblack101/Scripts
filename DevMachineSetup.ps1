# Set-ExecutionPolicy unrestricted
#.\DevMachineSetup.ps1 -prepOS -tools

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



)

if( $prepOS ) 
{
	Write-Host "Prepping OS Starting"
    Set-ExecutionPolicy unrestricted
    Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

    Write-Host "Configuring OS settings"
    ShowFileExtensions
    choco install taskbar-never-combine -y -force
	Write-Host "Configuring OS settings Complete"


	Write-Host "Prepping OS Complete"
}


function ShowFileExtensions{
    Push-Location
    Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
    Set-ItemProperty . HideFileExt "0"
    Pop-Location
}




if( $tools ) {
	Write-Host "Installing Tools"
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
    choco install winmerge -y
    choco install conemu -y
    choco install putty -y
    choco install dotnetcore-sdk -y
    choco install postman -y
    choco install nodejs -y
    choco install azure-data-studio
    choco install seq -y
    choco install microsoft-teams -y
    choco install greenshot -y
    choco install -y visualstudiocode -y
    choco install visualstudio2019professional -y
    choco install resharper -y
    npm install cypress --save-dev
    
	Write-Host "Installing Tools Complete"
    
   
}


