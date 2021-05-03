pipeline {
    agent {
        docker { 
            registryUrl 'https://hub.docker.com/repository/docker/5634654/docker_build'
            image '5634654/docker_build:lts' 
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
                sh 'docker build -t app2 .'
                sh 'docker tag app2 5634654/docker_build:lts'
                sh 'docker push 5634654/docker_build:lts'
            }
        }
        stage ('deploy') {
            steps {
                sh 'docker run -d 5634654/docker_build:lts'
            }
        }
        
    }
}