pipeline {
    agent {
        docker {
            image 'maven:3.8.4-jdk-11'
        }
    }

    stages {
        stage ('Build') {

            steps {
                sh 'mvn -B -DskipTests clean package'
                
            }
        }

    }
}
