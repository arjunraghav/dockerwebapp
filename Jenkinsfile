pipeline {
    agent any

    stages {
        stage('SCM checkout') {
            steps {
                echo "========executing SCM checkout========"
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/arjunraghav/dockerwebapp.git'
            }
        }
        stage('build dockerfile'){
            steps{
                echo "========executing dockerfile build========"
                sh 'docker build -t arjunraghava/webapp:0.1 .'
            }
        }
        stage('push docker image'){
            steps{
                withCredentials([string(credentialsId: 'dockerhubPassword', variable: 'dockerhubPassword')]) {
                    sh 'docker login -u arjunraghava -p ${dockerhubPassword}'
                }
                echo "========executing push docker image to docker hub========"
                sh 'docker push arjunraghava/webapp:0.1'
            }
        }
        stage('deploy docker service'){
            steps{
                echo "========deploying docker service========"
                sh '/usr/local/bin/docker-compose up -d'
            }
        }
        stage('test service'){
            steps{
                echo "========testing docker service========"
                sh 'curl -f http://localhost:55000 || exit 1'
            }
        }
    }
}
