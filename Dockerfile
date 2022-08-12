# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR C:/Users/Administrator/code/dotnetcode/ConsoleApp

# copy csproj and restore as distinct layers
COPY *.sln .
COPY ConsoleApp/*.csproj ./ConsoleApp/
RUN dotnet restore ConsoleApp.sln

# copy everything else and build app
COPY ConsoleApp/. ./ConsoleApp/
WORKDIR /source/ConsoleApp
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "ConsoleApp.dll"]
