FROM hyperledger/fabric-ca:1.4

# Install additional packages
RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install libltdl \
 && apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install less\
 && apt-get -y install busybox-extras


# Fix permissions
RUN chown -R :0 /etc/hyperledger \
 && chmod -R a+w /etc/hyperledger

EXPOSE 30330
CMD fabric-ca-server start -b admin:adminpw -d