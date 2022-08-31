# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source
COPY ConsoleApp.sln .
COPY ConsoleApp/ConsoleApp.csproj ./ConsoleApp/
COPY UnitTestProject/UnitTestProject.csproj ./UnitTestProject/
RUN dotnet restore
#RUN dotnet publish C:\source\ConsoleApp\ConsoleApp.sln
RUN dotnet publish -c Release -o out
# copy csproj and restore as distinct layers
#COPY ConsoleApp.sln .
#COPY ConsoleApp/ConsoleApp.csproj ./ConsoleApp/
#COPY UnitTestProject/UnitTestProject.csproj ./UnitTestProject/
#RUN dotnet restore

# copy everything else and build app
#COPY ConsoleApp/. ./ConsoleApp/
#WORKDIR /source/ConsoleApp
#CMD ["C:\\Program Files (x86)\\MSBuild\\12.0\\Bin\\msbuild.exe"] 
#RUN dotnet publish -c Release -o out
#want to check the below mentioned steps for checking the publish using docker
#RUN dotnet publish -c release -o /ConsoleApp --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /ConsoleApp
COPY --from=build /source ./
ENTRYPOINT ["dotnet", "ConsoleApp.dll"]
ENTRYPOINT ["dotnet", "UnitTestProject.dll"]
