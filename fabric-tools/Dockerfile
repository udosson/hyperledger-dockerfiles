FROM hyperledger/fabric-tools:2.0

# Install additional packages
RUN apk add --no-cache \
	libltdl \
	rsync \
	nano \
	joe \
	less \
    p7zip \
    busybox-extras

# Fix permissions
RUN mkdir /fabric \
 && chown -R :0 /fabric \
 && chmod -R a+w /fabric\
 && mkdir /opt/gopath \
 && chown -R :0 /opt/gopath \
 && chmod -R a+w /opt/gopath