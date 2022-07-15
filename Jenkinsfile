pipeline {
    agent any
    triggers {
        pollSCM('*/1 * * * *')
    }
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')
    }

    stages {
        stage('Clone and Checkout') {
            steps{
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
                bat "mvn clean test"
            }
        }
        stage('Package'){
            steps{
                bat "mvn clean package"
            }
        }
        stage('Install'){
            steps{
                bat "mvn clean install"
            }
        }
    }
}