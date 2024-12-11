# List of application IDs to install
$applications = @(
    "OpenVPNTechnologies.OpenVPN"
)

# Function to install an application
function Install-Application {
    param (
        [Parameter(Mandatory)]
        [string]$AppId
    )

    Write-Host "Installing $AppId..." -ForegroundColor Cyan

    # Run winget to install the application
    try {
        winget install --id $AppId --silent --accept-source-agreements --accept-package-agreements -e
        if ($LASTEXITCODE -eq 0) {
            Write-Host "$AppId installed successfully!" -ForegroundColor Green
        } else {
            Write-Host "Failed to install $AppId. Exit code: $LASTEXITCODE" -ForegroundColor Red
        }
    } catch {
        Write-Host "An error occurred while installing $AppId: $_" -ForegroundColor Red
    }
}

# Iterate over the application IDs and install each one
foreach ($appId in $applications) {
    Install-Application -AppId $appId
}

Write-Host "All installations complete!" -ForegroundColor Yellow
