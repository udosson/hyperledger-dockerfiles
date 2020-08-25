FROM hyperledger/explorer-db:1.1.2

ARG NSS_WRAPPER_VERSION=1.1.5

# Install additional packages
RUN apk add --no-cache \
	libltdl \
	rsync \
	nano \
	joe \
	less \
	p7zip \
	gettext \
	busybox-extras

# Add nss_wrapper
RUN echo -e "#ifndef NSS__H\n#define NSS__H\n\nenum nss_status\n{\n\tNSS_STATUS_TRYAGAIN = -2,\n\tNSS_STATUS_UNAVAIL = -1,\n\tNSS_STATUS_NOTFOUND = 0,\n\tNSS_STATUS_SUCCESS = 1,\n\tNSS_STATUS_RETURN = 2\n};\n\n#endif" > /usr/local/include/nss.h \
	&& apk add --no-cache --virtual .nss_wrapper-build-deps build-base cmake cmocka-dev \
	&& wget -O- https://ftp.samba.org/pub/cwrap/nss_wrapper-${NSS_WRAPPER_VERSION}.tar.gz | tar xzf - \
	&& mkdir nss_wrapper-${NSS_WRAPPER_VERSION}/build && \
	(cd nss_wrapper-${NSS_WRAPPER_VERSION}/build \
	&& cmake .. -DUNIT_TESTING:BOOL=ON \
	&& make -j "$(nproc)" \
	&& make -j "$(nproc)" CTEST_OUTPUT_ON_FAILURE=TRUE test \
	&& make install) \
	&& ln -s /usr/local/lib/libnss_wrapper.so /usr/lib/libnss_wrapper.so \
	&& rm -rf nss_wrapper-${NSS_WRAPPER_VERSION} /usr/local/include/nss.h

# Need to set user to postgres
ADD ./templates/passwd.template /tmp/passwd.template
ADD ./scripts/start_postgres.sh /tmp/start_postgres.sh

# Fix permissions
RUN chown -R :0 /var/lib/postgresql/data \
	&& chmod -R a+w /var/lib/postgresql/data \
	&& chown -R :0 /opt \
	&& chmod -R a+w /opt \
	&& chgrp -R 0 /tmp/ \
	&& chmod -R g=u /tmp/ \
	&& chgrp -R 0 /etc/passwd \
	&& chmod -R g=u /etc/passwd \
	&& chgrp 0 /tmp/start_postgres.sh \
	&& chmod 755 /tmp/start_postgres.sh


