dotnet tool install --global Microsoft.DataApiBuilder

#if packae is already installed, update it to the latest version
dotnet tool update --global Microsoft.DataApiBuilder

dotnet tool list --global

dab init --database-type "mssql" --host-mode "Development" --connection-string "Server=localhost;User Id=dab;Database=AdventureWorks2017;Password=dab;TrustServerCertificate=True;Encrypt=True;"

dab add Person --source "Person.Person" --permissions "anonymous:*"
dab add PersonPassword --source "Person.Password" --permissions "anonymous:*"
dab add PersonPhone --source "Person.PersonPhone" --permissions "anonymous:*"

dab start

