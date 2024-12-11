# List of applications to install
$applications = @(
    @{ Name = "Open VPN"; Id = "OpenVPNTechnologies.OpenVPN" }
)

# Function to install an application
function Install-Application {
    param (
        [Parameter(Mandatory)]
        [string]$AppName,
        [Parameter(Mandatory)]
        [string]$AppId
    )

    Write-Host "Installing $AppName ($AppId)..." -ForegroundColor Cyan

    # Run winget to install the application
    try {
        winget install --id $AppId --silent --accept-source-agreements --accept-package-agreements -e
        if ($LASTEXITCODE -eq 0) {
            Write-Host "$AppName installed successfully!" -ForegroundColor Green
        } else {
            Write-Host "Failed to install $AppName. Exit code: $LASTEXITCODE" -ForegroundColor Red
        }
    } catch {
        Write-Host "An error occurred while installing $AppName: $_" -ForegroundColor Red
    }
}

# Iterate over the applications and install each one
foreach ($app in $applications) {
    Install-Application -AppName $app.Name -AppId $app.Id
}

Write-Host "All installations complete!" -ForegroundColor Yellow
