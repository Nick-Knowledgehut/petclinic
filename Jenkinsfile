pipeline {
   agent {
    docker {
      image 'bryandollery/petclinic-pipeline-engine'
      args '-v /var/run/docker.sock:/var/run/docker.sock'
    }
  }
  stages {
    stage("Hello") {
      steps {
        echo "Hello"
      }
    }
  }
}
