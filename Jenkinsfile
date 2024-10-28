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
        //             npm test
        //         '''
        //     }
        // }


        stage('SSH Example') {
            steps {
                echo 'Building..'
                sshagent(['192.168.56.67']) {
                    sh 'ssh -o StrictHostKeyChecking=no -l ${SSH_CREDENTIALS_ID_USR} ${REMOTE_HOST} '
                    echo HelloWorld
                    ls -la
                    ''
                   
                }
            }
        }
    }
}