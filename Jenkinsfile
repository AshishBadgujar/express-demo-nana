// Declarative //
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                nodejs('Node-16.11.0'){
                    sh 'cd app/'
                    sh 'npm install'
                    sh 'npm build'
                }
                 echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
// Script //
// node {
//     stage('Build') {
//         echo 'Building....'
//     }
//     stage('Test') {
//         echo 'Building....'
//     }
//     stage('Deploy') {
//         echo 'Deploying....'
//     }
// }
