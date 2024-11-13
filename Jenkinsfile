pipeline {
    agent any
    environment {
        REPO_URL = 'https://github.com/JAIMITOMEX/Games_Collector.git'
    }
    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning the repository...'
                git url: "${REPO_URL}", branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker images...'
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
                sh 'curl -f http://localhost:3000 || exit 1'
            }
        }
        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                sh 'docker compose exec nombre_del_servicio pytest || true'  // Ajusta según las pruebas disponibles
            }
        }
    }
    post {
        always {
            echo 'Cleaning up...'
            sh 'docker compose down'
        }
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for details.'
        }
    }
}
