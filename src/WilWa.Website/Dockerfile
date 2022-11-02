#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM node:lts AS frontend
WORKDIR /app
COPY ./website-vue .
RUN yarn install --inline-builds
RUN yarn build

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["WilWa.Website/WilWa.Website.csproj", "WilWa.Website/"]
RUN dotnet restore "WilWa.Website/WilWa.Website.csproj"
COPY . .
COPY --from=frontend /app/dist WilWa.Website/wwwroot
ENTRYPOINT tail -f /dev/null
RUN dotnet build "WilWa.Website/WilWa.Website.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WilWa.Website/WilWa.Website.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WilWa.Website.dll"]

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS devbase
WORKDIR /app
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs && corepack enable

FROM devbase AS vsdev
# See https://aka.ms/containerfastmode to understand how Visual Studio
# uses this Dockerfile to build your images for faster debugging.

FROM devbase AS codedev
RUN apt update && apt install unzip && curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l /vsdbg
COPY [ "./WilWa.Website/DevScripts/codedev-entrypoint.sh", "/scripts/" ]
ENTRYPOINT [ "/scripts/codedev-entrypoint.sh" ]