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
      post {
        success {
          echo 'Test succeeded'
          script {
            mail(bcc: 'heena.sood@infotools.com',
            body: "Run ${node_name}-#${option_inside} succeeded. To get more details, visit the build results page: ${Tester}.",
            cc: 'heena.sood@infotools.com',
            from: 'jenkins-admin@gmail.com',
            replyTo: 'heena.sood@infotools.com',
            subject: "${node_name} ${option_inside} succeeded",
            to: env.notification_email)
            if (env.archive_war =='yes')
            {
              // ArchiveArtifact plugin
              // archiveArtifacts '**/java-calculator-*-SNAPSHOT.jar'
            }
            // Cucumber report plugin
            // cucumber fileIncludePattern: '**/java-calculator/target/cucumber-report.json', sortingMethod: 'ALPHABETICAL'
            //publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: true, reportDir: '/home/reports', reportFiles: 'reports.html', reportName: 'Performance Test Report', reportTitles: ''])
            echo 'Mail send'
          }


        }

        failure {
          echo 'Test failed'
          mail(bcc: 'heena.sood@infotools.com', body: "Run ${node_name}-#${option_inside} succeeded. To get more details, visit the build results page: ${Tester}.", cc: 'heena.sood@infotools.com', from: 'jenkins-admin@gmail.com', replyTo: 'heena.sood@infotools.com', subject: "${node_name} ${option_inside} failed", to: env.notification_email)

        }

      }
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
  }
  environment {
    Tester = 'Heena'
    Windows = 'windows'
    Linux = 'linux'
  }
}