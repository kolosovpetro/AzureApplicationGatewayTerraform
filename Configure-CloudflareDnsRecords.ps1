Set-Location -Path $PSScriptRoot

$zoneName = "razumovsky.me"

$newDnsEntriesHashtable = @{ }

$gatewayPublicIp = $(terraform output -raw gateway_frontend_ip)

Write-Host "Gateway public IP: $gatewayPublicIp"

$newDnsEntriesHashtable["agwy-dev.$zoneName"] = $gatewayPublicIp
$newDnsEntriesHashtable["agwy-qa.$zoneName"] = $gatewayPublicIp

.\cloudflare\Upsert-CloudflareDnsRecord.ps1 `
    -ApiToken $env:CLOUDFLARE_API_KEY `
    -ZoneName $zoneName `
    -NewDnsEntriesHashtable $newDnsEntriesHashtable
