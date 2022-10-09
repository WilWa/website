#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["src/WilWa.Website/WilWa.Website.csproj", "src/WilWa.Website/"]
RUN dotnet restore "src/WilWa.Website/WilWa.Website.csproj"
COPY . .
WORKDIR "/src/src/WilWa.Website"
RUN dotnet build "WilWa.Website.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WilWa.Website.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WilWa.Website.dll"]

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS vsdev
WORKDIR /app