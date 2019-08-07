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
            echo "EXECUTED AT ${DATE_TAG}"
          }
        }
      }
    }
    stage('Test') {
      steps {
        powershell(script: './build.ps1 -script "./build.cake" -target "Test" -verbosity normal', returnStatus: true)
      }
    }
    stage('Build/test') {
      steps {
        script {
          def builds = [:]

          for (def option in ["one", "two"]) {
            def node_name = ""
            if ("one" == "${option}") {
              node_name = "node001"
            } else {
              node_name = "node002"
            }

            def option_inside = "${option}"

            builds["${node_name} ${option_inside}"] = {
              node {
                stage("Build Test ${node_name} ${option_inside}") {

                  echo "5th stage"
                  sh 'ping -c 10 localhost'
                }
              }
            }
          }
          parallel builds
        }

      }
    }
  }
  environment {
    Tester = 'Heena'
  }
}