# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
FROM openjdk:11
#WORKDIR C:/Users/Administrator/code/dotnetcode/ConsoleApp
SHELL ["cmd", "/S", "/C"]

#ADD https://aka.ms/vs/16/release/vs_buildtools.exe C:\tools\fordotnet\vs_buildtools.exe
#ADD https://dist.nuget.org/win-x86-commandline/v5.8.1/nuget.exe C:\tools\fordotnet\Nuget\nuget.exe
# copy csproj and restore as distinct layers
COPY *.sln .
COPY ConsoleApp/*.csproj ./ConsoleApp/
COPY UnitTestProject/*.csproj ./ConsoleApp/
RUN java -version
Run dotnet --version
RUN dotnet restore

# copy everything else and build app
COPY ConsoleApp/. ./ConsoleApp/
WORKDIR /source/ConsoleApp
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "ConsoleApp.dll"]
