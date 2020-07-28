FROM udosson/hyperledger-indy-node:latest

RUN validator-info

# Fix permission for OpenShift
RUN chown -R :0 /var/lib/indy/ \
 && chmod -R a+w /var/lib/indy/ \
 && chown -R :0 /var/log/indy/ \
 && chmod -R a+w /var/log/indy/ \
 && chown -R :0 /etc/indy/ \
 && chmod -R a+w /etc/indy/ \    
 && chown indy:indy /var/log/indy/ 
 
# Expose ports
EXPOSE 9701 9702

init_indy_node Commerzbank 1.2.3.4 9701 1.2.3.4 9702 commerzbank000000000000000000001
start_indy_node Commerzbank 0.0.0.0 9701 0.0.0.0 9702 
3WDBTLJLnv4cKpCGUDXCan1m8WLxAopYNy2vJcqUVyPz
3WDBTLJLnv4cKpCGUDXCan1m8WLxAopYNy2vJcqUVyPz

start_indy_node Commerzbank 0.0.0.0 9701 0.0.0.0 9702