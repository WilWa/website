Set-Location -Path "../WilWa.Website"
[string]$password = [Guid]::NewGuid().ToString("N")
dotnet dev-certs https -ep $env:APPDATA\.aspnet\https\WilWa.Website.pfx -p $password
Add-Content -NoNewLine -Path ../WilWa.Website/devHttps.env -Value ASPNETCORE_Kestrel__Certificates__Default__Password=$password`n
Add-Content -NoNewLine -Path ../WilWa.Website/devHttps.env -Value ASPNETCORE_Kestrel__Certificates__Default__Path=/https/WilWa.Website.pfx`n
dotnet dev-certs https --trust