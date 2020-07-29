FROM udosson/hyperledger-indy-node:latest

RUN validator-info

# Fix permission for OpenShift
RUN chown -R :0 /var/lib/indy/ \
 && chmod -R a+w /var/lib/indy/ \
 && chown -R :0 /var/log/indy/ \
 && chmod -R a+w /var/log/indy/ \
 && chown -R :0 /etc/indy/ \
 && chmod -R a+w /etc/indy/ 
 
# Expose ports
EXPOSE 9701 9702