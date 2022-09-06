pipeline {
    agent any

    stages {
        stage('Clone GitHub Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/swancrawford/webapp.git'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t swancrawford/webapp-dev .'
            }
        }
        stage('Push Image to Docker Repo') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubpassword', usernameVariable: 'dockerhubuser')]) {
                sh "docker login -u ${env.dockerhubuser} -p ${env.dockerhubpassword}"
                sh 'docker push swancrawford/webapp-dev'
                }
            }
        }
        stage('Deploy Image to Azure') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'az', passwordVariable: 'azpassword', usernameVariable: 'azuser')]) {
                sh "az login -u ${env.azuser} -p ${env.azpassword}"
                sh 'az aks get-credentials --resource-group tacx-k8s-dev --name webapp-dev'
		sh 'kubectl apply -f webapp-dev.yaml --force=true'
		sh 'kubectl rollout restart deploy webapp-dev'
                }
            }
        }
    }
}
