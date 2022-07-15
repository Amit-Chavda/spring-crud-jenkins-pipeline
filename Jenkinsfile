pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    triggers {
        pollSCM('*/1 * * * *')
    }
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')
    }

    stages {
        stage('Clone and Checkout') {
            steps {
                git 'https://github.com/Amit-Chavda/spring-crud-jenkins-pipeline.git'
            }
        }
        stage('Compile') {
            steps {
                bat "mvn clean compile"
            }
        }
        stage('Test') {
            steps {
                bat "mvn test"
            }
        }
        stage('Package') {
            steps {
                bat "mvn package"
            }
        }
        stage('Install') {
            steps {
                bat "mvn install"
            }
        }

        stage('build docker image') {
            steps {
                bat 'docker build -t amitchavda00/spring-crud-jenkins-pipeline:latest .'
            }
        }
        stage('login dockerhub') {

            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push') {

            steps {
                sh 'docker push amitchavda00/spring-crud-jenkins-pipeline:latest'
            }
        }

    }
    post {
        always {
            sh 'docker logout'
        }
    }
}