FROM ubuntu:16.04

# Install environment
RUN apt-get update -y && apt-get install -y \
	git \
	wget \
	python3.5 \
	python3-pip \
	python-setuptools \
	python3-nacl \
	apt-transport-https \
	ca-certificates \
	supervisor \
    rsync \
	vim \
	curl \
	software-properties-common

RUN pip3 install -U \
	pip==9.0.3 \
	setuptools

# Install Indy-node
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 
# RUN bash -c 'echo "deb https://repo.sovrin.org/deb xenial stable" >> /etc/apt/sources.list'
RUN add-apt-repository 'deb [arch=amd64] https://repo.sovrin.org/deb xenial stable'
RUN sed -i "s/https/http/g" /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y indy-node


# Prepare the environments
RUN sed -i "s/None/'ssi4de_test'/" /etc/indy/indy_config.py


# Retrieve and store pool_transaction_genesis file
RUN mkdir -p /var/lib/indy/ssi4de_test  

RUN curl https://lissi-network.azurewebsites.net/genesis/pool_transactions_lissitest_genesis --output /var/lib/indy/ssi4de_test/pool_transactions_genesis

# Fix permission for OpenShift
RUN chown -R :0 /var/lib/indy/ \
 && chmod -R a+w /var/lib/indy/ \
 && chowen -R :0 /var/log/indy/ \
 && chmod -R a+w /var/log/indy/ \
 && chown -R :0 /etc/indy/ \
 && chmod -R a+w /etc/indy/ 
 

# Expose ports
EXPOSE 9701 9702

