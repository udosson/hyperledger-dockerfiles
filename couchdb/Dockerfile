FROM hyperledger/fabric-couchdb:0.4.18

# Edit docker-entrypoint. rmv all chwon and find commands and rmv gosu
RUN sed -i 's/chown.*//g' /docker-entrypoint.sh \
&& sed -i 's/gosu//g' /docker-entrypoint.sh \
&& sed -i 's/find.*//g' /docker-entrypoint.sh

# Change permission of production directory to root
RUN chmod +x /docker-entrypoint.sh \
  && chown -R :0 /opt/couchdb/ \
  && chmod -R g+rwx /opt/couchdb/ 


# Create docker.ini file and change owner
RUN touch /opt/couchdb/etc/local.d/docker.ini
RUN chown -R :0 /opt/couchdb/etc/local.d
 
# WORKDIR /opt/couchdb
# EXPOSE 5984 4369 9100

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/opt/couchdb/bin/couchdb"]



#--------
# Official Hyperledger Fabric base image

# Entrypoint and command
# ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
# CMD ["/opt/couchdb/bin/couchdb"]

#Setup directories and permissions
# RUN chmod +x /docker-entrypoint.sh \
#  && chown -R couchdb:couchdb /opt/couchdb/etc/default.d/ /opt/couchdb/etc/vm.args \
#  && chmod -R 0770 /opt/couchdb/data \
#  && chmod 664 /opt/couchdb/etc/*.ini \
#  && chmod 664 /opt/couchdb/etc/default.d/*.ini \
#  && chmod 775 /opt/couchdb/etc/*.d
#---------

#---------
# GitHub tocosonic
#Prepare folder access rights
# RUN chown -R :0 /opt/couchdb/ \
#  && chmod -R g+rwx /opt/couchdb/ \
#  && sed -i 's/; admin = admin/;admin = mysecretpassword/' /docker-entrypoint.sh \
#  && sed -i 's/chown.*//g' /docker-entrypoint.sh \
#  && sed -i 's/su-exec couchdb \"$@\"/exec \"$@\"/g' /docker-entrypoint.sh
#---------