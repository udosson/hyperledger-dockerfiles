FROM hyperledger/explorer-db:1.1.2


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
RUN mkdir /var/lib/postgresql/data \
 && chown -R :0 /var/lib/postgresql/data \
 && chmod -R a+w /var/lib/postgresql/data 
