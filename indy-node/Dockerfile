FROM udosson/hyperledger-indy-node:latest

# RUN groupadd -r indy && useradd -r -g indy indy

# Fix permission for OpenShift
RUN chgrp -R 0 /var/lib/indy/ \
 && chmod -R g=u /var/lib/indy/ \
 && chgrp -R 0 /var/log/indy/ \
 && chmod -R g=u /var/log/indy/ \
 && chgrp -R 0 /etc/indy/ \
 && chmod -R g=u /etc/indy/ 

 
# Expose ports
EXPOSE 9701 9702

USER indy