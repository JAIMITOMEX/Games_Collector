pipeline {
    agent any
    environment {
        REPO_URL = 'https://github.com/JAIMITOMEX/Games_Collector.git'
    }
    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning the repository...'
                git url: "https://github.com/JAIMITOMEX/Games_Collector.git", branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker compose build'
            }
        }
        stage('Run Docker Containers') {
            steps {
                echo 'Starting Docker containers...'
                sh 'docker compose up -d'
            }
        }
        stage('Health Check') {
            steps {
                echo 'Performing health check on application...'
                sh 'curl -f http://127.0.0.1:3000 || exit 1'
            }
        }
    }
    post {
        always {
            echo 'Cleaning up...'
            sh 'docker compose down'
        }
    }
}
