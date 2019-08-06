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
            script {
              DATE_TAG = java.time.LocalDate.now()
              DATETIME_TAG = java.time.LocalDateTime.now()
            }

            echo "This is Tested By ${Tester} and ${DATETIME_TAG} and ${DATE_TAG}"
          }
        }
      }
    }
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            powershell(script: './build.ps1 -script "./build.cake" -target "Build" -verbosity normal', returnStatus: true)
          }
        }
        stage('Date/Time') {
          steps {
            echo "TimeStamp: ${currentBuild.startTimeInMillis}"
            echo "TimeStamp: ${Util.getTimeSpanString(System.currentTimeMillis())}"
          }
        }
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