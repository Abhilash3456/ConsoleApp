# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.sln .
COPY ConsoleApp/*.csproj ./ConsoleApp/
RUN dotnet restore C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/pipelinecodescan/ConsoleApp/ConsoleApp.sln

# copy everything else and build app
COPY ConsoleApp/. ./ConsoleApp/
WORKDIR /source/ConsoleApp
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "ConsoleApp.dll"]
