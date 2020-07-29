FROM udosson/hyperledger-indy-node:latest

# RUN groupadd -r indy && useradd -r -g indy indy
RUN apt-get install -y \
	nano 

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
 
# Expose ports
EXPOSE 9701 9702

USER indy