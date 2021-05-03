pipeline {
    agent {
        docker { 
            registryUrl 'https://hub.docker.com/repository/docker/5634654/docker_build'
            image '5634654/docker_build:latest' 
        }
    }
    stages {
        stage ('Source-git') {
            steps {
                git 'https://github.com/arthur1gust/docker_6.git'
            }
        }
        stage ('Build') {
            steps {
                sh 'docker build -t app'
                sh 'docker tag app  5634654/docker_build:latest'
                sh 'docker push 5634654/docker_build:latest'
            }
        }
        stage ('deploy') {
            steps {
                sh 'docker run -d 5634654/docker_build:latest'
            }
        }
        
    }
}