Set-Location -Path "../WilWa.Website"
[string]$password = [Guid]::NewGuid().ToString("N")
dotnet dev-certs https -ep $env:APPDATA\ASP.NET\Https\WilWa.Website.pfx -p $password
dotnet dev-certs https --trust
Add-Content -Path ../WilWa.Website/devHttps.env -Value ASPNETCORE_Kestrel__Certificates__Default__Password=$password
Add-Content -Path ../WilWa.Website/devHttps.env -Value ASPNETCORE_Kestrel__Certificates__Default__Path=/https/WilWa.Website.pfx