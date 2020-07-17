FROM openshift/jenkins-agent-maven-35-centos7

# Switch User to root
USER root

# Install Python and pip
RUN yum update -y && \
    yum install -y python36 python36-pip && \
# pip must be pointing to pip3.6
    ln -s /usr/bin/pip3.6 /bin/pip && \
# python must be pointing to python3.6 
    rm /usr/bin/python && \
    ln -s /usr/bin/python3.6 /usr/bin/python

# Install python packages
RUN pip install ruamel.yaml && \    
    pip install python-dotenv

# Download Hyperledger Fabric Binaries
RUN mkdir -p $HOME/hlf-binaries && \ 
    cd $HOME/hlf-binaries && \ 
    curl https://raw.githubusercontent.com/hyperledger/fabric/master/scripts/bootstrap.sh | bash -s -- 2.2.0 1.4.7 -d -s && \
    cd $HOME
# Add Binaries to PATH as env
ENV PATH="${HOME}/hlf-binaries/bin:${PATH}"

# Switch user back to 1001
USER 1001