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
         stage ('Deploy to tomcat') {

            steps {
                  deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://3.88.187.87:8080/')], contextPath: 'path', onFailure: false, war: '**/*.war'
                }
            }
    }
}
