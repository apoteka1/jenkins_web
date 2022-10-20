pipeline {
    agent any
    options {
      timestamps()
    }
    stages {
      stage("first stage"){
        steps {
          echo "hello"
        }
      }

      stage("Print environment variables") {
        steps {
          sh '''
            printenv
          '''
        }
      }
    }
}