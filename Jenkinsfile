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
                sh 'docker build -t aditya22nair/vueapp .'
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
        container('docker'){

withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_REGISTRY_PASSWORD', 
usernameVariable: 'DOCKER_REGISTRY_USERNAME')]) {

    sh """
      docker login -u aditya22nair@gmail.com -p 'XwK2/5F\$SLirKaY' docker.io
      docker push aditya22nair/vueapp 
    """
    // dockerImage.push("latest")
  }


        //   docker.withRegistry( 'https://registry.hub.docker.com/', registryCredential ) { //https://registry.hub.docker.com/v2/
        //     // dockerImage.push("latest")
        //     // docker.image(dockerimagename).push()
        //   }
        }
        }
      }
    }
    stage('Deploy to Minikube') {
        steps {
            script {

                container('kubectl'){
                    // Set Minikube Docker environment
                    sh 'eval $(minikube docker-env)'

                    // Apply Kubernetes Deployment
                    sh 'kubectl apply -f deployment.yaml'
                 }
                }
            }
        }
  }
}