@Library('jenkins_shared@main') _

def printFromFunction(){
	println("I am printing from a function")
}

def replaceString() {
	def text = readFile file: "index.html"
	text = text.replaceAll("%BUILD_NUMBER%", "${BUILD_NUMBER}")
	writeFile file: "index.html", text: text
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
				replaceString()
				hello()
				helloVariable("joe")

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