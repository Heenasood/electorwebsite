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
        powershell(script: 'powershell -ExecutionPolicy ByPass -File build.ps1 -target "Build" -verbosity normal', returnStdout: true, returnStatus: true)
      }
    }
    stage('Test') {
      steps {
        powershell(script: 'powershell -ExecutionPolicy ByPass -File build.ps1 -target "Test" -verbosity normal', returnStatus: true, returnStdout: true)
      }
    }
  }
  environment {
    Tester = 'Heena'
  }
}