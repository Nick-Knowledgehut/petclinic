pipeline {
   agent {
    docker {
      image 'bryandollery/petclinic-pipeline-engine'
      args '-v /run/docker.sock:/run/docker.sock'
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
