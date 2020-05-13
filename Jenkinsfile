pipeline {
  agent {
    docker {
      image 'bryandollery/petclinic-pipeline-engine'
      args '-v /var/run/docker.sock:/var/run/docker.sock'
    }
  } 
    
  stages {
    stage('Deploy Servers') {
      steps {
        sh 'echo wibble'
        sh 'ls -gAlFh /'
        sh 'whoami'
        sh 'docker-compose up -d'
      }
    }

    stage('Tests') {
      parallel {
        stage('Test UI') {
          steps {
            git 'https://github.com/BryanDollery/petclinic-test.git'
            dir(path: 'petclinic-test') {
              sh 'mvn clean compile test'
            }

          }
        }

        stage('Test API') {
          steps {
            git 'https://github.com/BryanDollery/kh-postman-project.git'
            dir(path: 'kh-postman-project') {
              sh 'newman run petclinic.json -e newman.json'
            }

          }
        }
      }

      stage('Kill Servers') {
        steps {
          sh 'docker-compose down'
        }
      }
    }
  }
}
