def printFromFunction(){
	println("I am printing from a function")
}

pipeline {
    agent any

    options {
    	timestamps()
    }

    stages {
      
    	stage("build"){
			steps {
    			echo "build"
				printFromFunction()
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