storm-docker
============

Dockerfiles for building a storm cluster. Inspired by [https://github.com/ptgoetz/storm-vagrant](https://github.com/ptgoetz/storm-vagrant) and [https://github.com/wurstmeister/storm-docker](https://github.com/wurstmeister/storm-docke)

The images are available directly from [https://hub.docker.com/u/lintong/](https://hub.docker.com/u/lintong/)

##Pre-Requisites

- install docker-compose [http://docs.docker.com/compose/install/](http://docs.docker.com/compose/install/)

##Usage

Start a cluster:

- ```docker-compose up -d```

Destroy a cluster:

- ```docker-compose stop```

Add more supervisors:

- ```docker-compose scale supervisor=3```

##Building

- ```rebuild.sh```

##FAQ
### How can I access Storm UI from my host?
Take a look at docker-compose.yml:

    ui:
      image: lintong/storm-ui:1.0.0
	      ports:
	        - "49080:8080"

This tells Docker to expose the Docker UI container's port 8080 as port 49080 on the host<br/>

### How can I deploy a topology?
Since the nimbus host and port are not default, you need to specify where the nimbus host is, and what is the nimbus port number.<br/>
Following the example above, after discovering the nimbus host IP (could be localhost, could be our docker VM ip as in the case of boot2docker), run the following command:

    storm jar target/your-topology-fat-jar.jar com.your.package.AndTopology topology-name -c nimbus.host=192.168.59.103 -c nimbus.thrift.port=49627

