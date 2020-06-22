FROM hyperledger/fabric-couchdb:0.4.20

# Edit docker-entrypoint. rmv all chwon and find commands and rmv gosu
RUN sed -i 's/chown.*//g' /docker-entrypoint.sh \
&& sed -i 's/gosu couchdb//g' /docker-entrypoint.sh \
&& sed -i 's/find.*//g' /docker-entrypoint.sh

# Change permission of production directory to root
RUN chmod +x /docker-entrypoint.sh \
  && chown -R :0 /opt/couchdb/ \
  && chmod -R g+rwx /opt/couchdb/ 

# Create docker.ini file and change owner
RUN touch /opt/couchdb/etc/local.d/docker.ini
RUN chown -R :0 /opt/couchdb/etc/local.d
 
# Change entrypoint. Without "tini" and "--"
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/opt/couchdb/bin/couchdb"]