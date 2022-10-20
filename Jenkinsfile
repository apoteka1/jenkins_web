pipeline {
    agent any
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