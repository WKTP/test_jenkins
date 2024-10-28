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
                    image 'docker:27.3.1-dind'
                }
            }
            steps {
                withDockerRegistry(credentialsId: 'DOCKER_CREDS', url: 'https://index.docker.io/v1/') {
                    sh "docker build --help"
                    sh "ls -la"
                    sh "docker build -t wktp/prem:lmao1 ."
                    sh "docker push"
                }
               
                
            }
        }
                    // sh "sudo systemctl status docker"
                    // sh "sudo systemctl start docker"
                    // sh "sudo systemctl enable docker"
                    // sh "sudo systemctl status docker"
//  sh '''
//                 echo "in docker"
//                 docker --version
//                 docker build -t wktp/prem:lmao1 .
//                 '''
// docker login -u ${DOCKER_CREDS_USR} -p ${DOCKER_CREDS_PSW}

        // stage('Test') {
        //     agent {
        //         docker {
        //             image 'node:18-alpine'
        //             reuseNode true
        //         }
        //     }
        //     steps{
        //         sh '''
                    //    node --version
                    //    npm --version
        //             test -f public/index.html
        //             test -f src/App.js
        //             test -f src/App.css
        //             npm test
        //         '''
        //     }
        // }

//WORKED!!! DONT DELETE
        // stage('SSH and DEPLOY') {
        //     steps {
        //         echo 'Building..'
        //         sshagent(['192.168.56.67']) {
        //             sh '''ssh -o StrictHostKeyChecking=no -l ${SSH_CREDS_USR} ${REMOTE_HOST} " \
        //             if [ -n "$(docker ps -aq)" ]; then docker ps -aq | xargs docker stop | xargs docker rm; fi && \
        //             docker run -d -p 5000:5000 wktp/prem:build_from_GitLabtemplate && \
                    
        //             docker ps -aq"'''
        //         }
        //     }
        // }
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
