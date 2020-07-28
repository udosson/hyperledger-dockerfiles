FROM udosson/hyperledger-indy-node:latest

RUN echo "file contents" > /var/log/indy/validator-info.log

# Fix permission for OpenShift
RUN chown -R :0 /var/lib/indy/ \
 && chmod -R a+w /var/lib/indy/ \
 && chown -R :0 /var/log/indy/ \
 && chmod -R a+w /var/log/indy/ \
 && chown -R :0 /etc/indy/ \
 && chmod -R a+w /etc/indy/ \    
 && chown indy:indy /var/log/indy/validator-info.log
 
# Expose ports
EXPOSE 9701 9702