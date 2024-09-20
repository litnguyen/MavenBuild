pipeline {
	agent any
	environment {
        MAVEN_HOME = '/opt/apache-maven' // Replace with your Maven installation path
        PATH = "${MAVEN_HOME}/bin:${env.PATH}"
    }
	
	stages{
		stage('Checkout Code'){
			steps{
				checkout scm
				}
			}
	
	stage('Build'){
		steps {
        sh "${MAVEN_HOME}/bin/mvn clean install -Dmaven.test.skip=true"  
		}   
	}
	
	stage('Archive Artifact'){
		steps{
		archiveArtifacts artifacts:'target/*.war'
		}
	}
	
	stage('deployment'){
		steps{
		deploy adapters: [tomcat(url: 'http://54.179.71.80:8080/', 
                              credentialsId: 'TomcatCreds')], 
                     war: 'target/*.war',
                     contextPath: 'app'
		}
		
	}
	
	stage('Notification'){
		steps{
		emailext(
			subject: "Job Completed",
			body: "Jenkins pipeline job for maven build job completed",
			to: "khangnguyenchi194@gmail.com"
		)
		}
	}
	}
}