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


        stage('Build') {
            agent {
                docker {
                    image 'docker:27.3.1-cli'
                }
            }
            steps {
                sh '''
                ls -la
                node --version
                npm --version
                docker login -u ${DOCKER_CREDS_USR} -p ${DOCKER_CREDS_PSW}
                '''
            }
        }


        // stage('Test') {
        //     agent {
        //         docker {
        //             image 'node:18-alpine'
        //             reuseNode true
        //         }
        //     }
        //     steps{
        //         sh '''
        //             test -f public/index.html
        //             test -f src/App.js
        //             test -f src/App.css
        //             npm test
        //         '''
        //     }
        // }


        stage('SSH and DEPLOY') {
            steps {
                echo 'Building..'
                sshagent(['192.168.56.67']) {
                    sh '''ssh -o StrictHostKeyChecking=no -l ${SSH_CREDS_USR} ${REMOTE_HOST} " \
                    if [ -n "$(docker ps -aq)" ]; then docker ps -aq | xargs docker stop | xargs docker rm; fi && \
                    docker run -d -p 5000:5000 wktp/prem:build_from_GitLabtemplate && \
                    
                    docker ps -aq"'''
                }
            }
        }
    }
}



// 
// echo RUNNING APTGET UPDATE IN RANDOMPC INSTANCE && \
// sudo apt-get update && \
// echo INSTALL DOCKER && \
// sudo apt-get install docker.io -y && \ 
// if [ -n "$(docker ps -aq)" ]; then docker ps -aq | xargs docker stop | xargs docker rm; fi && \
// docker run -d -p 5000:5000 wktp/prem:build_from_GitLabtemplate && \
// "'''
