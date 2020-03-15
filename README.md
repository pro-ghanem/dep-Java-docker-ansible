# DevOpsArea Sample Java App -example

Build war with maven and ghanem-app framework

Steps are the following:

1. Clone the repository to your local machine
2. The Dockerfile will do:

        A. Create maven container <br />
        
     * copy pom.xml to /tmp <br />
     * copy folder "src" to /tmp/src <br />
     * Go to /tmp folder then run "mvn package"<br />
      
      The previos command will generate ghanem-app-1.2.war<br />
        
        B. Create tomcat container<br />
        
     * Will move the file ghanem-app-1.2.war from maven container to /webapp in tomcat contaner<br />
     * Do health check to make sure that the artifact is deployed

3. Run 'docker build -t ghanem-app .' <br />
    
     * Will create a Docker image called devopsarea <br />

4. Run 'docker run -d -p 8080:8080 --name ghanem-app-1.2.war -sample-java-app ghanem-app ' <br />
     * Will create a container called devopsarea-sample-java-app and will forward the container internal port 8080 to locathost 8080 in the hosted machine 

5. Open [http://localhost:8080/ghanem-app-1.2/](http://localhost:8080/ghanem-app-1.2/) in your browser and see the result.
