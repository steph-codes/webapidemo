#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["WebAPIdemo.csproj", "."]
RUN dotnet restore "./WebAPIdemo.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "WebAPIdemo.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebAPIdemo.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebAPIdemo.dll"]