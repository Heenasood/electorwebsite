pipeline {
  agent any
  stages {
    stage('Enter') {
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
            mail(subject: 'MAIL from BLUE OCEAN - Stage1', body: "Test mail from blue ocean. Tester: ${TESTER}", from: 'heena.ah9@gmail.com', mimeType: 'text/html', to: "$To")
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
        emailext(subject: 'EMAIL FROM JENKINS', body: 'TEST EMAIL ${TESTER}', from: 'heena.ah9@gmail.com', mimeType: 'text/html', to: 'heena.sood@infotools.com', attachLog: true)
      }
    }
    stage('Mail') {
      steps {
        mail(subject: 'MAIL from BLUE OCEAN', body: "'Test mail from blue ocean. Tester: ${TESTER}'", from: 'heena.ah9@gmail.com', mimeType: 'text/html', to: 'heena.sood@infotools.com')
      }
    }
    stage('About_Build') {
      steps {
        emailext(subject: '$BUILD_STATUS', body: '''${JELLY_SCRIPT, template="html"} <br\\><br/> THIS IS FROM ABOUT BUILD <br\\><br/><br\\> Please find build url below for checking logs<br\\><br/><br\\><br/><br\\><br/>

   Thanks, <br\\> Team Jenkins $BUILD_URL''', attachLog: true, mimeType: 'text/html', to: 'heena.sood@infotools.com')
      }
    }
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