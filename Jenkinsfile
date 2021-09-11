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
        stage('Artifactory configuration') {

     steps {

        rtServer (
         
            id: "jfrog",
     
            url: "http://34.201.119.61:8081//artifactory",

            credentialsId: "my-jfrog",
            bypassProxy: true

            )
          }
        }
        stage('Deploy Artifact') {

       steps {
         
          rtUpload (

              ServerId: 'jfrog'

                  )

              }

           }
        stage ('Quality gate') {
            
          steps {
                 waitForQualityGate abortPipeline: true
              }
          }
         stage ('Deploy to tomcat') {

            steps {
                  deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://3.88.187.87:8080/')], contextPath: 'path', onFailure: false, war: '**/*.war'
                }
         }
    }
  }
