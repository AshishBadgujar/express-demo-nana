// Declarative //
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'trigger on commit Building..'
                nodejs("NodeJS 16.11.0"){
                    sh 'cd app/'
                    sh 'npm install'
                    sh 'npm build'
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                 nodejs("NodeJS 16.11.0"){
                    sh 'cd app/'
                    sh 'npm test'
                }
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
