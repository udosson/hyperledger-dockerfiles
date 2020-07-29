FROM udosson/hyperledger-indy-node:latest

ARG user=indy
ARG group=indy
ARG uid=1000
ARG gid=1000

RUN addgroup -g ${gid} -S ${group} && \
    adduser -u ${uid} -S ${group} -G ${group}
    
# Fix permission for OpenShift
RUN chgrp -R 0 /var/lib/indy/ \
 && chmod -R g=u /var/lib/indy/ \
 && chgrp -R 0 /var/log/indy/ \
 && chmod -R g=u /var/log/indy/ \
 && chgrp -R 0 /etc/indy/ \
 && chmod -R g=u /etc/indy/ 

 
# Expose ports
EXPOSE 9701 9702