pipeline {
	agent none
	stages {
		stage('Integration UI Test') {
			parallel {
				stage('Deploy') {
                    agent {
                        docker {
                            image 'docker:latest' 
                            args '--privileged'  // Required for DinD
                        }
                    }
					environment {
                        DOCKER_HOST = 'tcp://docker:2376'
                        DOCKER_TLS_VERIFY = '1'
                        DOCKER_CERT_PATH = '/certs/client'
                    }
					steps {
						sh './jenkins/scripts/deploy.sh'
						input message: 'Finished using the web site? (Click "Proceed" to continue)'
						sh './jenkins/scripts/kill.sh'
					}
				}
				stage('Headless Browser Test') {
					agent {
						docker {
							image 'maven:3-alpine' 
							args '-v /root/.m2:/root/.m2' 
						}
					}
					steps {
						sh 'mvn -B -DskipTests clean package'
						sh 'mvn test'
					}
					post {
						always {
							junit 'target/surefire-reports/*.xml'
						}
					}
				}
			}
		}
	}
}