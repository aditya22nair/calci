pipeline {
  environment {
    dockerimagename = "vue-app"
    dockerImage = ""
  }
    agent {
    kubernetes {
      label 'promo-app'  // all your pods will be named with this prefix, followed by a unique id
      idleMinutes 5  // how long the pod will live after no jobs have run on it
      yamlFile 'build-pod.yaml'  // path to the pod definition relative to the root of our project 
    }
  }
  stages {

    stage('Build image') {
      steps{
        script {
          container('docker') {
                dockerImage = docker.build dockerimagename
            }
        }
      }
    }
    stage('Pushing Image') {
      environment {
          registryCredential = 'dockerhub'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com/v2/', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Deploy to Minikube') {
        steps {
            script {
                    // Set Minikube Docker environment
                    sh 'eval $(minikube docker-env)'

                    // Apply Kubernetes Deployment
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
  }
}