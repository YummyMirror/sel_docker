pipeline {
    agent any
    stages {
        stage('Build Jar') {
            steps {
                bat "mvn clean package -DskipTests"
            }
        }
        stage('Build Image') {
            steps {
                bat "docker build -t='yummymirror1/selenium-docker2' ."
            }
        }
        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'HeatLakers#1', usernameVariable: 'yummymirror1')]) {
                    bat "docker login --username=yummymirror1 --password=HeatLakers#1"
                    bat "docker push yummymirror1/selenium-docker2:latest"
                }
            }
        }
    }
}
