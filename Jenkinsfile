pipeline {
  agent any
  stages {
    stage('Deploy Servers') {
      steps {
        sh 'docker-compose up -d'
      }
    }

    stage('Test UI') {
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
    }

  }
}