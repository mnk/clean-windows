[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install googlechrome -y
choco install setdefaultbrowser -y
choco install notepadplusplus -y
choco install cygwin -y

# Must be executed for each user:
SetDefaultBrowser.exe HKLM "Google Chrome"
