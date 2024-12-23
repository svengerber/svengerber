# SSH Agent
Get-Service ssh-agent | Set-Service -StartupType Automatic -PassThru | Start-Service

# Tools
winget install -e --id OpenVPNTechnologies.OpenVPN
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id SlackTechnologies.Slack
winget install -e --id Citrix.Workspace
winget install -e --id Jabra.Direct
winget install -e --id MuhammedKalkan.OpenLens
winget install -e --id Docker.DockerDesktop
winget install -e --id WiresharkFoundation.Wireshark
winget install -e --id JanDeDobbeleer.OhMyPosh -s winget
winget install -e --id JetBrains.IntelliJIDEA.Ultimate
winget install -e --id VivaldiTechnologies.Vivaldi
winget install -e --id Greenshot.Greenshot
winget install -e --id Microsoft.PowerToys
winget install -e --id Git.Git