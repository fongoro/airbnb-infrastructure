def COLOR_MAP = [
    'Success': 'good',
    'Failure': 'danger',
    ]
    
pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                echo 'Cloning project codebase'
                git branch: 'main', url: 'https://github.com/fongoro/airbnb-infrastructure.git'
                sh 'ls'
            }
        }
        
        stage('Verify Terraform Version') {
            steps {
                echo 'Verifying terraform version'
                sh 'terraform --version'
            }
        }
        
        stage('Terraform init') {
            steps {
                echo 'Initializing terraform project...'
                sh 'terraform init'
            }
        }
        
        stage('Terraform validate') {
            steps {
                echo 'validating terraform project...'
                sh 'terraform validate'
            }
        }
        
        stage('Terraform plan') {
            steps {
                echo 'terraform plan for the dry run...'
                sh 'terraform plan'
            }
        }
        
        stage('Checkov Scan') {
            steps {
                
                sh """
                sudo pip3 install checkov
                checkov -d . --skip-check CKV_AWS_79,CKV2_AWS_41,CKV2_AWS_6,CKV_AWS_18,CKV_AWS_145,CKV_AWS_21,CKV_AWS_144,CKV_AWS_19
                
                """
            }
        }
        
        stage('Manual approval') {
            steps {
                input 'Approval required for deployment'
            }
        }
        
        stage('Terraform apply') {
            steps {
                echo 'terraform apply for the dry run...'
                sh 'sudo terraform apply --auto-approve'
            }
        }
    }
    
    post {
        always {
            echo 'i will always say Hello again'
            slackSend channel:'#glorious-w-f-devops-alerts',color: COLOR_MAP[currentBuild.currentResult],message:"*${currentBuild.currentResult}:* job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}"
        }
    }
}
