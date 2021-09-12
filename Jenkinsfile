pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                git 'https://github.com/austinobioma/Hepa-project.git'
            }
        }
      stage('Build') {
            steps {
               sh ''' cd MywebApp && mvn clean package'''
            }
        }
      stage('Test') {
            steps {
                sh ' cd MywebApp && mvn test'
            }
        }
        stage ('Code Qualty Scan') {
            
           steps {
                  withSonarQubeEnv('sonar') {
             sh "mvn -f MywebApp/pom.xml sonar:sonar"
                      
               }
            }
       }
        stage ('Quality gate') {
            
          steps {
                 waitForQualityGate abortPipeline: true
              }
          }
        stage('Artifactory configuration') {

     steps {

        rtServer (
         
            id: "my-jfrog",
     
            url: "http://3.83.236.155:8082/artifactory/jenkins-integrations",

            credentialsId: "baba7fa5-a142-40b1-b368-ead653ab7bc6",
            bypassProxy: true,
            timeout: 300

            )
          }
        }
        stage('Deploy Artifact') {

       steps {
         
          rtUpload (

              serverId: 'my-jfrog'

                  )

              }

           }
         stage ('Deploy to tomcat') {

            steps {
                  deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://3.88.187.87:8080/')], contextPath: 'path', onFailure: false, war: '**/*.war'
                }
         }
    }
  }
