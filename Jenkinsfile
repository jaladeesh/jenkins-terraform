pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('accesskey')
        AWS_SECRET_ACCESS_KEY = credentials('secretkey')
    }

    stages {
        
        stage('Checkout Code') {
            steps {
                script {
                    // Checkout code from the specific branch
                    checkout([$class: 'GitSCM',
                        branches: [[name: '*/feature/terra-development']],
                        userRemoteConfigs: [[url: 'https://github.com/jaladeesh/jenkins-terraform.git']]
                    ])
                }
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan'
                }
            }
        }

        stage('Approve Apply') {
            steps {
                script {
                    input message: 'Approve to Apply?', ok: 'Apply'
                }
            }
        }
        
        stage('Terraform Apply') {
            when {
                expression { return true } // This will always run if the pipeline reaches this stage after approval
            }
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    
    post {
        always {
            cleanWs()
        }
    }

}
