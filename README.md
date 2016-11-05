# Dockerfile: Filebeat Container

## Introduction

`Dockerfile` to create [Filebeat](https://www.elastic.co/products/beats/filebeat) containers.


### Build the docker image

```bash
docker build -t filebeat .
```

### Start a docker container

```bash
docker run -v <FILEBEAT_CONF_DIR>:/etc/filebeat -dt filebeat
```

**Note:** The config directory must contain a file named *filebeat.yml*!

### Example config

An example file can be found [here](conf/filebeat.yml).

