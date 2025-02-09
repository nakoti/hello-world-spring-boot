pipeline {
    agent any

    tools {
        maven 'Maven 3.8.8'
        jdk 'jdk-17.0.6'
    }
   
    stages {
        stage('Pre-Build') {
            steps {
                notifyBuildStart()
            }
        }

        stage('PR-Build') {
            when {
                changeRequest()
            }
            steps {
                sh "mvn clean install -U -Psonar -Dsonar.qualitygate.wait=true"
            }
        }
  }
}
