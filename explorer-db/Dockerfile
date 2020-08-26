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

# Need to set user to postgres
ADD ./templates/passwd.template /tmp/passwd.template
ADD ./scripts/start_postgres.sh /tmp/start_postgres.sh

# Fix permissions
RUN chown -R :0 /var/lib/postgresql/data \
	&& chmod -R g=u /var/lib/postgresql/data \
	&& chown -R :0 /opt \
	&& chmod -R g=u /opt \
	&& chgrp -R 0 /tmp/ \
	&& chmod -R g=u /tmp/ \
	&& chgrp -R 0 /etc/passwd \
	&& chmod -R g=u /etc/passwd \
	&& chgrp 0 /tmp/start_postgres.sh \
	&& chmod 755 /tmp/start_postgres.sh

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 5432


