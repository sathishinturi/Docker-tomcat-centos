# Docker-tomcat-centos

#Build the Image
docker build -t=imagename .

#create and run container in daemon mode and specified respective ports
docker run -it --name=containername -p portnumber:8080 -d imageid

#create and run container on interactivemode
docker run -it --name=containername -p portnumber:8080 -d imageid 
(or)
docker run -it containermode /bin/bash

#check the inner level of container

docker exec -it containerid /bin/bash

#For checking logs
docker logs --tail 50 --follow --timestamps containerid or docker logs 
