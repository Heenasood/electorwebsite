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
                  echo "${node_name} ${Tester} ${option_inside}"
                }
              }
            }
          }
          parallel builds
        }

      }
    }
    stage('Notify') {
      steps {
        emailext(subject: 'EMAIL FROM JENKINS', body: 'TEST EMAIL', from: 'heena.ah9@gmail.com', mimeType: 'text/html', to: 'Heena.Sood@infotools.com')
      }
    }
  }
  environment {
    Tester = 'Heena'
    Windows = 'windows'
    Linux = 'linux'
  }
  post {
    always {
      echo 'This will always run'

    }

    success {
      echo 'This will run only if successful'

    }

    failure {
      mail(bcc: 'heena.sood@infotools.com', body: "<b>Example</b><br>Project: ${Tester} <br>Build Number: ${node_name} <br> URL de build: ${option_inside}", cc: 'heena.sood@infotools.com', charset: 'UTF-8', from: 'heena.sood@infotools.com', mimeType: 'text/html', replyTo: 'heena.sood@infotools.com', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: 'heena.sood@infotools.com')

    }

    unstable {
      echo 'This will run only if the run was marked as unstable'

    }

    changed {
      echo 'This will run only if the state of the Pipeline has changed'
      echo 'For example, if the Pipeline was previously failing but is now successful'

    }

  }
}