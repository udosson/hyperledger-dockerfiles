FROM hyperledger/fabric-couchdb:0.4.18


RUN chmod +x /docker-entrypoint.sh \
  && chown -R couchdb:couchdb /opt/couchdb/ \
  && chmod -R 777 /opt/couchdb/
 
# WORKDIR /opt/couchdb
# EXPOSE 5984 4369 9100

# ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
# CMD ["/opt/couchdb/bin/couchdb"]

# Official Hyperledger Fabric base image
# Setup directories and permissions
# RUN chmod +x /docker-entrypoint.sh \
#  && chown -R couchdb:couchdb /opt/couchdb/etc/default.d/ /opt/couchdb/etc/vm.args \
#  && chmod -R 0770 /opt/couchdb/data \
#  && chmod 664 /opt/couchdb/etc/*.ini \
#  && chmod 664 /opt/couchdb/etc/default.d/*.ini \
#  && chmod 775 /opt/couchdb/etc/*.d

# GitHub tocosonic
#Prepare folder access rights
# RUN chown -R :0 /opt/couchdb/ \
#  && chmod -R g+rwx /opt/couchdb/ \
#  && sed -i 's/; admin = admin/;admin = mysecretpassword/' /docker-entrypoint.sh \
#  && sed -i 's/chown.*//g' /docker-entrypoint.sh \
#  && sed -i 's/su-exec couchdb \"$@\"/exec \"$@\"/g' /docker-entrypoint.sh