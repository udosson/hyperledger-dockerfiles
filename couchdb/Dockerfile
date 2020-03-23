FROM hyperledger/fabric-couchdb:0.4.18

RUN chmod +x /docker-entrypoint.sh \
 && chown -R :0 /opt/couchdb/ \
 && chmod -R g+rwx /opt/couchdb/ \
 && sed -i 's/; admin = admin/;admin = mysecretpassword/' /docker-entrypoint.sh \
 && sed -i 's/chown.*//g' /docker-entrypoint.sh \
 && sed -i 's/su-exec couchdb \"$@\"/exec \"$@\"/g' /docker-entrypoint.sh

WORKDIR /opt/couchdb
EXPOSE 5984 4369 9100

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["/opt/couchdb/bin/couchdb"]

#--> mit couchdb:couchdb probieren
