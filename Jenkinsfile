pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = '1'
        IMAGE_NAME = 'mazen1393/flaskapp'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        def customImage = docker.build("${IMAGE_NAME}:0.0.1")
                        customImage.push()
                    }
                }
            }
        }
        stage('Test'){
            agent {
                docker {
                    image 'ubuntu:latest'
                }
            }
            steps {
                echo 'Testing ....'
            }
        }
        
        stage('Run Container') {
            steps {
                script {
                    sh '''
                    docker run -d \
                        --name flaskapp \
                        -p 5555:5000 \
                        ${IMAGE_NAME}:0.0.1
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
            input message: 'Approve Deployment?'
            script {
                echo "Deployment Approved! Deploying application..."
            }
            }
        }
    }
}
