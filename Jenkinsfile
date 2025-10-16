pipeline {
    agent any

    environment {
        REGISTRY = 'docker.io'
        IMAGE_NAME = 'kunalwankhade/backup-app' // 🔸 change this
        IMAGE_TAG = 'latest'
        DOCKER_CREDENTIALS = 'dockerhub-cred' // 🔸 match the Jenkins credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                echo '📥 Checking out source code...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker image...'
                sh """
                    docker build -t $IMAGE_NAME:$IMAGE_TAG .
                """
            }
        }

        stage('Login to Docker Registry') {
            steps {
                echo '🔐 Logging in to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: "$DOCKER_CREDENTIALS", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin $REGISTRY
                    """
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                echo '🚀 Pushing image to Docker Hub...'
                sh """
                    docker push $IMAGE_NAME:$IMAGE_TAG
                """
            }
        }
    }

    post {
        success {
            echo '✅ Docker image built and pushed successfully!'
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}

