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
               sh 'cd MyWebApp && mvn clean  package'
            }
        }
      stage('Test') {
            steps {
                sh 'cd MyWebApp && mvn test'
            }
        }
