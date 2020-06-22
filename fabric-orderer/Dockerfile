FROM hyperledger/fabric-orderer:2.1

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
RUN mkdir /var/hyperledger/bin \
 && chown -R :0 /etc/hyperledger \
 && chmod -R a+w /etc/hyperledger \
 && chown -R :0 /var/hyperledger \
 && chmod -R a+w /var/hyperledger \
 && mkdir -p /opt/gopath/src/github.com/hyperledger/fabric \
 && chown -R :0 /opt/gopath \
 && chmod -R a+w /opt/gopath 

EXPOSE 31010

CMD orderer start