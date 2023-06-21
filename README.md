
# SQL Server in Docker

This GitHub repository aims to provide a centralized location for community engagement. In here you will find documentation, Dockerfiles and additional developer resources. 

## mssql-server-linux

This Ubuntu-based image is built and maintened by Microsoft, and published on [Docker Hub](https://hub.docker.com/r/microsoft/mssql-server-linux/).

This GitHub repository contains a Docker Compose file for setting up a Microsoft SQL Server (MSSQL) container with a specified version and configuration. 

The Compose file defines a network called "app" using the bridge driver. It also includes a service called "db-mssql" which represents the MSSQL container. 

The "db-mssql" service is configured with a container name, port mapping, and environment variables. The port mapping allows the MSSQL container to listen on a specified port (defined by the variable `${DB_PORT}`) for incoming connections. The environment variables specify that the EULA is accepted (`ACCEPT_EULA=Y`) and set the SA password for the MSSQL instance (defined by the variable `${DB_PASSWORD}`). 

The service uses a Dockerfile located in the `.docker/mssql/` directory to build the MSSQL container. There is a commented-out section that suggests the use of the `${DB_PASSWORD}` variable as a build argument.

Additionally, a volume is mounted to persist the MSSQL data. The source directory `./storage/db/mssql_db/data/` is mapped to the container's `/var/opt/mssql/data` directory, ensuring that the data is stored persistently even if the container is stopped or removed.

The "db-mssql" service is connected to the "app" network to allow communication with other services or containers within the same network.

Overall, this repository provides a convenient setup for running an MSSQL container with specific configurations using Docker Compose.

## Environment variables

To run this project, you will need to add the following environment variables to your .env

`ACCEPT_EULA`
`SA_PASSWORD`


## Install


```bash
 
  ### Start container
  docker-compose up -d
  docker-compose up --build -d [-f docker-compose.yml]

  ### Stop container
  docker-compose down

  ### Show containers
  docker ps -a

  ### Get IP Container
  docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' db-mssql

  ### Run command on container
  docker exec -it db-mssql bash -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Root@123' -Q 'CREATE DATABASE TestDB;'"

  ### Show databases
  docker exec -it db-mssql bash -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Root@123' -Q 'SELECT name FROM master.dbo.sysdatabases;'"

```
    
## Etiquetas


[![MIT License](https://img.shields.io/apm/l/atomic-design-ui.svg?)](https://github.com/tterb/atomic-design-ui/blob/master/LICENSEs)
[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)
[![AGPL License](https://img.shields.io/badge/license-AGPL-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)



