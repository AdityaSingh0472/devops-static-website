pipeline {
    agent any

    environment {
        IMAGE_NAME = "devops-static-site"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning the repository..."
                git 'https://github.com/AdityaSingh0472/devops-static-website.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Run Container') {
            steps {
                echo "Running Docker container..."
                // Stop any existing container with the same name (ignore errors)
                sh 'docker stop devops-container || true && docker rm devops-container || true'
                // Run the container on port 8080
                sh "docker run -d --name devops-container -p 8080:80 ${IMAGE_NAME}"
            }
        }
    }

    post {
        success {
            echo "✅ Build and deployment successful!"
        }
        failure {
            echo "❌ Build or deployment failed!"
        }
    }
}
