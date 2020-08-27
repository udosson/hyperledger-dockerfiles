FROM centos/postgresql-10-centos7:latest

USER root
RUN yum -y install epel-release
RUN yum -y install joe \
    && yum -y install telnet \
    && yum -y install net-tools \
    && yum -y install less \
    && yum -y install jq \
    && yum -y install less \
    && yum -y install nodejs \
    && yum -y install less 


# default database name for HLF Explorer db connection
ENV DATABASE_DATABASE 	fabricexplorer

# default username for HLF Explorer db connection
ENV DATABASE_USERNAME 	hppoc

# default password for HLF Explorer db connection
ENV DATABASE_PASSWORD 	password


# Copy files
COPY app/persistence/fabric/postgreSQL/db/explorerpg.sql  /opt/explorerpg.sql
COPY app/persistence/fabric/postgreSQL/db/updatepg.sql    /opt/updatepg.sql
COPY app/persistence/fabric/postgreSQL/db/createdb.sh     /docker-entrypoint-initdb.d/createdb.sh
COPY app/persistence/fabric/postgreSQL/db/processenv.js   /opt/processenv.js

WORKDIR /opt