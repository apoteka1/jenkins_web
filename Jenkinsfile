pipeline {
    agent any

    options {
    	timestamps()
    }

    stages {
      
    	stage("build"){
			steps {
    			echo "build"
			}
    	}

    	stage("test"){
			parallel {
				stage("testing on Linux") {
					steps {
						echo "Testing on Linux"
					}
				}
				stage("testing on Mac") {
					steps {
						echo "Testing on Mac"
					}
				}
			}
			
    	}

    	stage("deploy"){
			steps{
    			echo "deploy"
			}
    	}

    }
}