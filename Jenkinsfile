pipeline {
    agent any
    // agent {
    //     docker {
    //         image 'node:18-alpine'
    //         reuseNode true
    //     }
    // }

    environment {
        SSH_CREDS = credentials('SSH_CREDS')
        REMOTE_HOST = '192.168.56.67'
        DOCKER_CREDS = credentials('DOCKER_CREDS')
    }

    stages {

        // stage('Test') {
        //     agent {
        //         docker {
        //             image 'node:21-alpine'
        //         }
        //     }
        //     steps{
        //         sh "pwd"
        //         sh "whoami"
        //         sh "npm ci"
        //         sh "npm test"
        //         sh "ls -la"
        //     }
        // }


// WORKED!!! DONT DELETE
        // stage('Build') {
        //     steps {
        //         withDockerRegistry(credentialsId: 'DOCKER_CREDS', url: '') {
        //             sh '''pwd'''
        //             sh '''whoami'''
        //             sh '''docker build -t wktp/prem:${BUILD_ID} .'''
        //             sh '''docker push wktp/prem:${BUILD_ID}'''
        //         }
        //     }
        // }


// WORKED!!! DONT DELETE
        stage('Deploy') {
            steps {
                echo 'SSH in...'
                sshagent(['192.168.56.67']) {
                    sh '''ssh -o StrictHostKeyChecking=no -l ${SSH_CREDS_USR} ${REMOTE_HOST} " \
                    if [ -n "$(docker ps -aq)" ]; then docker ps -aq | xargs docker stop | xargs docker rm; fi && \
                    docker run -d -p 5000:5000 wktp/prem:build_from_GitLabtemplate"'''
                }
            }
        }
    }
}



// FIRST TIME SETUP

// echo RUNNING APTGET UPDATE IN RANDOMPC INSTANCE && \
// sudo apt-get update && \

// echo INSTALL DOCKER && \
// sudo apt-get install docker.io -y && \ 

// FIRST TIME SETUP
