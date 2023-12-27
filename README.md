## demo app - developing with Docker

This demo app shows a simple user profile app set up using 
- index.html with pure js and css styles
- nodejs backend with express module
- mongodb for data storage

All components are docker-based

### With Docker

#### To start the application

Step 1: Create docker network

    docker network create mongo-network 

Step 2: start mongodb 

    docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network mongo    

Step 3: start mongo-express
    
    docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password --net mongo-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express   

_NOTE: creating docker-network in optional. You can start both containers in a default network. In this case, just emit `--net` flag in `docker run` command_

Step 4: open mongo-express from browser

    http://localhost:8081

Step 5: create `user-account` _db_ and `users` _collection_ in mongo-express

Step 6: Start your nodejs application locally - go to `app` directory of project 

    npm install 
    node server.js
    
Step 7: Access you nodejs application UI from browser

    http://localhost:3000

### With Docker Compose

#### To start the application

Step 1: start mongodb and mongo-express

    docker-compose -f docker-compose.yaml up
    
_You can access the mongo-express under localhost:8080 from your browser_
    
Step 2: in mongo-express UI - create a new database "my-db"

Step 3: in mongo-express UI - create a new collection "users" in the database "my-db"       
    
Step 4: start node server 

    npm install
    node server.js
    
Step 5: access the nodejs application from browser 

    http://localhost:3000

#### To build a docker image from the application

    docker build -t my-app:1.0 .       
    
The dot "." at the end of the command denotes location of the Dockerfile.


### With Kubernetes

#### To start the application

Step 1: Create a kubernetes cluster with 1 controlplane and 2 workers

    kind create cluster --config kind-config.yaml 

Step 2: Setup nginx ingress in kind cluster

    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml    

Step 3: Build experss-app container locally
    
    docker build -t express-app:latest .   

Step 4: Load local docker image in kind cluster all nodes to make it accessible to the pods

    kind load docker-image express-app:latest

Step 5: Apply all manifest files it will create following:

    kubectl apply -f ./manifests/

- express-app deployment & it's service 
- mongo-express deployment
- mongodb statefulset & it's service
- network policy
- ingress
- persistent volume 
- persistent volume claim
- configmap
- secret

Step 7: Setup Domain names locally

Open powershell(Administrator) run below command :

    notepad C:\Windows\system32\drivers\etc\hosts

Add following entries in the file

    127.0.0.1   express.com
    127.0.0.1   mongo.com

Step 7: Access you nodejs application UI from browser

    http://express.com
    http://mongo.com

