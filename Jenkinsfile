pipeline {
    agent any
//    environment {
//        MSBUILD_SQ_SCANNER_HOME = tool name: 'scanmsbuild5.7', type: 'hudson.plugins.sonar.MsBuildSQRunnerInstallation'
//        PATH = "$PATH:C:/Program Files/Maven/apache-maven-3.8.6/apache-maven-3.8.6/bin"
//    }

    stages {
        stage ('Clean workspace') {
            steps {
                cleanWs()
            }
        }
        stage ('Git Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Abhilash3456/dotnetcode.git'
            }
        }
        stage ('msbuild') {
            steps {
                bat 'echo %PATH%'
                bat 'dotnet restore C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/sample/ConsoleApp/ConsoleApp.sln'
                bat 'dotnet build --configuration Release C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/pipelinecodescan/ConsoleApp/ConsoleApp.sln'
                bat 'dotnet publish C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/pipelinecodescan/ConsoleApp/ConsoleApp.sln'
            }
        }
        stage ('check version') {
            steps {
                bat 'java -version'
                bat 'dotnet --version'
//                bat 'mvn -version'
            }
        }
//        stage('Build + SonarQube analysis') {
//            steps {
//                withSonarQubeEnv('sonarqube-9.5') {
//                    bat 'dotnet C:/tools/SonarScanner.MSBuild.dll begin /k:"sonartoken" /d:sonar.host.url="http://54.184.136.79:9000/" /d:sonar.login="squ_861b1e419461fdc9330d5056bd1044fa596e823f"'
//                    bat 'dotnet build C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/pipelinecodescan/ConsoleApp/ConsoleApp.sln'
//                    bat 'dotnet C:/tools/SonarScanner.MSBuild.dll end /d:sonar.login="squ_861b1e419461fdc9330d5056bd1044fa596e823f"'
                   // bat 'dotnet C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/tools/hudson.plugins.sonar.MsBuildSQRunnerInstallation/scanmsbuild5.7/SonarScanner.MSBuild.dll begin /k:"sonartoken" /d:sonar.login="squ_272c063edcf9b0f25527b54fbcec3ad044d70de0"'
                    //bat 'MSBuild.exe C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/pipelinemsbuild/ConsoleApp/ConsoleApp.sln /t:Rebuild'
                    //bat 'SonarScanner.MSBuild.exe end /d:sonar.login="squ_272c063edcf9b0f25527b54fbcec3ad044d70de0"'
//                }
//            }
//        }
//        stage ('scan') {
//            steps {
//                withSonarQubeEnv('sonarqube-9.5') {
//                   // bat 'dotnet tool install --global dotnet-sonarscanner'
//                    bat 'dotnet sonarscanner begin /k:"sonartoken" /d:sonar.login="squ_272c063edcf9b0f25527b54fbcec3ad044d70de0"'
//                    //bat 'dotnet C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/tools/hudson.plugins.sonar.MsBuildSQRunnerInstallation/scanmsbuild5.7/SonarScanner.MSBuild.dll begin /k:"firstscan" /d:sonar.host.url="http://35.90.138.131:9000"  /d:sonar.login="sqp_d8e2e5b82e4bb4e99e67b17b19d835b35fbb59ea"'
//                }
//            }
//        }    
    }
}
