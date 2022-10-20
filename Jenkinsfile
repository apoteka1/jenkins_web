@Library('jenkins_shared@main') _



pipeline {
    agent any

    options {
    	timestamps()

    }

    stages {
      
    	stage("web build"){
			steps {
    			echo "build"
				script {
					utils.replaceString()
				}
				hello()
				helloVariable("joe")
				sh """
					mkdir -p docker
				"""

			}
    	}
		stage("docker build"){
			
				agent {
					docker {
						image "python:latest"
						args "-v ${WORKSPACE}/docker:/python/node"
					}
				}
				steps {
    			echo "building in docker"
					sh """
						python3 --version > /home/python/pythonversion.txt
					"""
				}
			
    	}

    	stage("test"){
			parallel {
				stage("testing on Linux") {
					steps {
						echo "Testing on Linux"
						sh """
							./test.sh ${BUILD_NUMBER}
						"""
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
				sshPublisher(publishers: [sshPublisherDesc(configName: 'Webserver', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'cp index.html /var/www/html/index.html', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'index.html')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])

			}
    	}

    }
	post {
		always {
			emailext body: "🫠 ${currentBuild.currentResult}: Job ${JOB_NAME} build ${BUILD_NUMBER}", subject: 'Jenkins', to: 'Joseph.ackroyd@ecs.co.uk'
			archiveArtifacts artifacts: 'index.html', fingerprint: true, followSymlinks: false
		}
	}
}