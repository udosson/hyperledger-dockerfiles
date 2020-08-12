# This image is a microservice in golang for the Degree chaincode
ARG NODE_VER=12.13.0
FROM node:${NODE_VER}-alpine

# Update and add packages
RUN apk add --no-cache \
	libltdl \
	rsync \
	nano \
	joe \
	less \
    busybox-extras

# Copy chaincode source dir to container
COPY ./src/ /chaincode/input

# Installs npm packages
RUN cp -R /chaincode/input/. /chaincode/output \
    && cd /chaincode/output \
    && npm install --production

# Copy chaincode with node_modules to workdir
RUN cp -R /chaincode/output/. /usr/local/src
WORKDIR /usr/local/src

EXPOSE 30111
# Start chaincode server
CMD [ "npm", "run", "start" ]

