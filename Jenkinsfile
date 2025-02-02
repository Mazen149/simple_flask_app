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
    }
}
