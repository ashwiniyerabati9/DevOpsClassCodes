pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        jdk "Java 1.8"
        maven "Maven"
    }

    stages {
        
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                echo "cloning"
                git 'https://github.com/ashwiniyerabati9/DevOpsClassCodes.git'

                // Run Maven on a Unix agent.
                sh "mvn compile"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    
                    echo "Compile success"
                    
                    //junit '**/target/surefire-reports/TEST-*.xml'
                    //archiveArtifacts 'target/*.jar'
                }
            }
        }
        stage('Test') {
            agent { label 'Jenkins_Slave' }
            steps {
                // Get some code from a GitHub repository
                echo "entered slave cloning and Unit Testing"
                git 'https://github.com/ashwiniyerabati9/DevOpsClassCodes.git'

                // Run Maven on a Unix agent.
                sh "mvn test"
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    
                    echo "Test success"
                    //
                    junit '**/target/surefire-reports/*.xml'
                    //archiveArtifacts 'target/*.jar'
                }
            }
        }
        stage('Code Coverage') {
            steps {
                // Get some code from a GitHub repository
                echo "Metric Check"
                //git 'https://github.com/ashwiniyerabati9/DevOpsClassCodes.git'

                // Run Maven on a Unix agent.
                echo "cobetura"
                sh "mvn cobertura:cobertura -Dcobertura.report.format=xml"
                echo "after cobetura"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                
                success {
                    cobertura autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: 'target/site/cobertura/coverage.xml', conditionalCoverageTargets: '70, 0, 0', failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0', maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false
                   // sh "cobertura autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: 'target/site/cobertura/**.xml)', conditionalCoverageTargets: '70, 0, 0', failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0', maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false"
                    //sh 'cobertura autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: 'target/site/cobertura/coverage.xml', conditionalCoverageTargets: '70, 0, 0', failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0', maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false"
                  
                }
            }
        }
        stage('package') {
            steps {
                // Get some code from a GitHub repository
                echo "Package"
               // Run Maven on a Unix agent.
                sh "mvn package"
            }

            post {
                //Maven was able to package.
                success {
                    
                    echo "Package success"
                  
                }
            }
        }
        stage('Deploy'){
			steps{
			    sh 'cp "/var/lib/jenkins/workspace/Build Pipeline/target/addressbook.war" . '
			    echo "copied"
			    ansiblePlaybook credentialsId: '8c059579-e9cb-474f-9d21-8ce68bb89b21', installation: 'Ansible', playbook: 'playbook_docker.yml'
				//sh 'docker build -t myimage:$BUILD_NUMBER .'
				//sh 'docker run -itd -P myimage:$BUILD_NUMBER'
			}
		}
        
    }
    post { 
        always { 
           cleanWs()
        }
    }
}
