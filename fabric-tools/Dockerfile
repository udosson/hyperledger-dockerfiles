FROM hyperledger/fabric-tools:2.0

# Install additional packages
RUN apk add --no-cache \
	libltdl \
	rsync \
	nano \
	joe \
	less \
    p7zip \
    busybox-extras \
	libtool \
	libltdl


# Fix permissions
RUN mkdir /fabric \
 && chown -R :0 /fabric \
 && chmod -R a+w /fabric\
 && mkdir -p /opt/gopath/src/github.com/hyperledger/fabric/peer \
 && chown -R :0 /opt/gopath \
 && chmod -R a+w /opt/gopath