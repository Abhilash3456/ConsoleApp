FROM mcr.microsoft.com/dotnet/sdk:6.0.400 AS build
RUN dotnet new console –name Hello
RUN dotnet run
WORKDIR /source
RUN dotnet new -l c#
RUN dotnet restore -v Information
RUN dotnet run
RUN dotnet build
COPY ConsoleApp.sln .
COPY ConsoleApp/ConsoleApp.csproj ./ConsoleApp/
COPY UnitTestProject/UnitTestProject.csproj ./UnitTestProject/
RUN dotnet restore
#RUN dotnet restore C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/sample 1/UnitTestProject/UnitTestProject.csproj
FROM mcr.microsoft.com/dotnet/aspnet:3.1
WORKDIR /ConsoleApp
COPY --from=build /source ./
ENTRYPOINT ["dotnet", "ConsoleApp.dll"]
ENTRYPOINT ["dotnet", "UnitTestProject.dll"]
FROM mcr.microsoft.com/dotnet/sdk:6.0.400
#RUN dotnet publish C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/sample 1/ConsoleApp.sln -c Release -o out
RUN dotnet build --configuration Release ConsoleApp.csproj
RUN dir
RUN cd Program Files
RUN dir
RUN linux
# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source
COPY ConsoleApp.sln .
COPY ConsoleApp/ConsoleApp.csproj ./ConsoleApp/
COPY UnitTestProject/UnitTestProject.csproj ./UnitTestProject/
RUN dotnet restore
RUN dotnet build --configuration Release ConsoleApp.sln
#RUN dotnet publish C:\source\ConsoleApp\ConsoleApp.sln
#RUN dotnet publish -o ConsoleApp\ConsoleApp\bin\Debug\netcoreapp3.1\ConsoleApp.exe
# copy csproj and restore as distinct layers
#COPY ConsoleApp.sln .
#COPY ConsoleApp/ConsoleApp.csproj ./ConsoleApp/
#COPY UnitTestProject/UnitTestProject.csproj ./UnitTestProject/
#RUN dotnet restore
RUN dotnet publish ConsoleApp/ConsoleApp.csproj -c Release -o /source/app
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
FROM mcr.microsoft.com/dotnet/sdk:6.0
RUN dir

Run dotnet publish ConsoleApp.sln
RUN cd C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/sample 1
RUN dir
