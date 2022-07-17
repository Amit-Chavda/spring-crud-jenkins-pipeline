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
    stage('push docker image') {
      steps {
        script {
          //withCredentials([string(credentialsId: 'dockerhub_token', variable: 'dockerhub_token')]) {
          //bat 'docker login -u amitchavda00 -p ${dockerhub_token}'
          bat 'docker push amitchavda00/spring-crud-jenkins-pipeline:latest'
          //}
        }
      }
    }

    stage('deploy in kubernetes') {
      steps {
        bat 'kubectl apply -f user-api-service.yaml'
      }
    }
  }
}