pipeline {
    agent any
    // agent {
    //     docker {
    //         image 'node:18-alpine'
    //         reuseNode true
    //     }
    // }

    environment {
        SSH_CREDENTIALS_ID = credentials('192.168.56.67')
        REMOTE_HOST = '192.168.56.67'
    }

    stages {


        // stage('Build') {
        //     agent {
        //         docker {
        //             image 'node:18-alpine'
        //             reuseNode true
        //         }
        //     }
        //     steps {
        //         sh '''
        //         ls -la
        //         node --version
        //         npm --version
        //         npm ci
        //         npm run build
        //         ls -la
        //         '''
        //     }
        // }


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


        stage('SSH Example') {
            steps {
                echo 'Building..'
                sshagent(['192.168.56.67']) {
                    sh "ssh -o StrictHostKeyChecking=no -l ${SSH_CREDENTIALS_ID_USR} ${REMOTE_HOST} ' \
                    echo RUNNING APTGET UPDATE IN RANDOMPC INSTANCE && \
                    echo INSTALL DOCKER && \
                    echo INTO SUPERUSER && \
                    sudo su && \
                    docker run -p 5000:5000 wktp/prem:build_from_GitLabtemplate'"
                }
            }
        }
    }
}
//echo RUNNING APTGET UPDATE IN RANDOMPC INSTANCE && \
// sudo apt-get update && \
//echo INSTALL DOCKER && \
// sudo apt-get install docker.io -y'"  