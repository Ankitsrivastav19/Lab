pipeline {
    agent any

    parameters {
        string(defaultValue: '1', description: 'Tag number for the Docker image', name: 'TAG_NUMBER')
    }

    environment {
        CONTAINER_NAME = "application"
    }

    stages {
        stage('Build') {
            steps {
                echo "Building the Docker image with tag ${TAG_NUMBER}..."
                sh "docker build -t ankit191919/application:${TAG_NUMBER} ."
                sh "docker push ankit191919/application:${TAG_NUMBER}"
            }
        }
        stage('Deploy') {
            steps {
                echo "Pulling and running the Docker container with tag ${TAG_NUMBER}..."
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

