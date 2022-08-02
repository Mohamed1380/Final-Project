pipeline {
    agent {label 'myslave'}

    stages {
        stage('git checkout') {
            steps {
                git 'https://github.com/mahmoud254/jenkins_nodejs_example.git'
            }
        }
        
        stage('build') {
            steps {
                sh 'docker build -f dockerfile . -t hamo138/nodejs:latest'
            }
        }
        
        stage('artifact') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'username')]){
                sh 'docker login -u ${username} -p ${pass}'
                sh 'docker push hamo138/nodejs:latest'
                
                }
            }
        }
        
        stage('git app') {
            steps {
                git 'https://github.com/Mohamed1380/Final-Project.git'
            }
        }
        
        stage('deploy') {
            steps 
            {
                //sh 'kubectl create namespace app-namespace'
                sh 'kubectl apply -f ./kubernetes/appdeployment/app.yml -n app-namespace'
                sh 'kubectl apply -f ./kubernetes/appdeployment/service.yml -n app-namespace'
                
            }
        }
    }
