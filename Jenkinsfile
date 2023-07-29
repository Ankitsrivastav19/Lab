pipeline {
    agent any
    environment {
        TAG_NUMBER = 0
        CONTAINER_NAME = "application"
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building the Docker image...'
                script {
                    TAG_NUMBER = TAG_NUMBER + 1
                }
                sh "docker build -t ankit191919/application:${TAG_NUMBER} ."
                sh "docker push ankit191919/application:${TAG_NUMBER}"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Pulling and running the Docker container...'
                sh "docker pull ankit191919/application:${TAG_NUMBER}"
                
                // Stop and remove the existing container if it exists
                sh "docker stop ${CONTAINER_NAME} || true"
                sh "docker rm ${CONTAINER_NAME} || true"
                
                // Run the new container on port 8080
                sh "docker run -d -p 5000:5000 --name ${CONTAINER_NAME} ankit191919/application:${TAG_NUMBER}"
            }
        }
    }
}

