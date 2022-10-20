@Library('jenkins_shared@main') _



pipeline {
    agent any

    options {
    	timestamps()

    }

    stages {
      
    	stage("build"){
			steps {
    			echo "build"
				script {
					utils.replaceString()
				}
				hello()
				helloVariable("joe")

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
				sshPublisher(publishers: [sshPublisherDesc(configName: 'Webserver', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'cp index.html /var/www/html/index.html', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: './index.html')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])

			}
    	}

    }
}