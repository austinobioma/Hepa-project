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
                  deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://18.206.231.193:8080/')], contextPath: 'MywebApp', war: '**/*.war'
                }
            }
    }
}
