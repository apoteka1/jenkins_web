def printFromFunction(){
	println("I am printing from a function")
}

def replaceString(){
	def file = readfile file: "index.html"

		println(file.replaceAll("%BUILD_NUMBER%","replaced"))
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
				replaceString()
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