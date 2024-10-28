pipeline {
    
    agent {
        docker {
            image 'node:18-alpine'
            reuseNode true
        }
    }

    environment {
        SSH_VAR = credentials('SSH_KEY')
    }

    stages {


        // stage('Build') {
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
                    sh "ssh -o StrictHostKeyChecking=no -l ${SSH_CREDENTIALS_ID_USR} ${REMOTE_HOST} 'echo HelloWorld'"
                }
            }
        }



    }
    // def remote = [:]
    // remote.name = "192.168.56.67"
    // remote.host = "192.168.56.67"
    // remote.allowAnyHosts = true

    // node {
    //     withCredentials([sshUserPrivateKey(credentialsId: 'sshUser', keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'userName')]) {
    //         remote.user = userName
    //         remote.identityFile = identity
    //         stage("SSH Steps Rocks!") {
    //             writeFile file: 'abc.sh', text: 'ls'
    //             sshCommand remote: remote, command: 'for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done'
    //             sshPut remote: remote, from: 'abc.sh', into: '.'
    //             sshGet remote: remote, from: 'abc.sh', into: 'bac.sh', override: true
    //             sshScript remote: remote, script: 'abc.sh'
    //             sshRemove remote: remote, path: 'abc.sh'
    //         }
    //     }
    // }
}