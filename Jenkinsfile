pipeline {
    // agent any
    agent {
        label 'node1'
    }

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
        stage('Deploy') {
            input{message 'Approve Deployment?'}
            steps {
                script {
                    sh '''
                    docker run -d \
                        --name flaskapp2 \
                        -p 4444:5000 \
                        ${IMAGE_NAME}:0.0.1
                    '''
                }
            }
        }
    }
}
