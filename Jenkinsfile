pipeline {
  agent any
  stages {
    stage('Enter') {
      environment {
        Tester = 'Heena'
      }
      parallel {
        stage('Enter') {
          steps {
            echo 'Enter Elector Website'
          }
        }
        stage('Tester') {
          steps {
            echo 'This is Tested By ${Tester}'
          }
        }
      }
    }
    stage('Build') {
      steps {
        powershell(script: './build.ps1 -script "./build.cake" -target "Build" -verbosity normal', returnStatus: true)
      }
    }
    stage('Test') {
      steps {
        powershell(script: './build.ps1 -script "./build.cake" -target "Test" -verbosity normal', returnStatus: true)
      }
    }
  }
  environment {
    Tester = 'Heena'
  }
}