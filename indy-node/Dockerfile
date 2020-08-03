FROM udosson/hyperledger-indy-node:latest

# RUN groupadd -r indy && useradd -r -g indy indy
RUN apt-get install -y \
	nano \
	libnss-wrapper \
	gettext

RUN curl https://raw.githubusercontent.com/udosson/hyperledger-dockerfiles/master/indy-node/templates/passwd.template --output /tmp/passwd.template

# RUN usermod -a -G 0 indy

# Fix permission for OpenShift
RUN chgrp -R 0 /var/lib/indy/ \
 && chmod -R g=u /var/lib/indy/ \
 && chgrp -R 0 /var/log/indy/ \
 && chmod -R g=u /var/log/indy/ \
 && chgrp -R 0 /etc/indy/ \
 && chmod -R g=u /etc/indy/ \
 && chgrp -R 0 /etc/passwd \
 && chmod -R g=u /etc/passwd \
 && chgrp -R 0 /etc/group \
 && chmod -R g=u /etc/group 

# RUN chown -R indy:root /var/lib/indy/ \
#  && chmod -R g=u /var/lib/indy/ \
#  && chown -R indy:root /var/log/indy/ \
#  && chmod -R g=u /var/log/indy/ \
#  && chown -R indy:root /etc/indy/ \
#  && chmod -R g=u /etc/indy/ \
#  && chown -R indy:root /etc/passwd \
#  && chmod -R g=u /etc/passwd \
#  && chown -R indy:root /etc/group \
#  && chmod -R g=u /etc/group 
 
# Expose ports
EXPOSE 9701 9702

# Set user
USER 1000
