FROM udosson/hyperledger-indy-node 

# Fix permission for OpenShift
RUN chown -R :0 /var/lib/indy/ \
 && chmod -R a+w /var/lib/indy/ \
 && chown -R :0 /var/log/indy/ \
 && chmod -R a+w /var/log/indy/

# Expose ports
EXPOSE 9701 9702

