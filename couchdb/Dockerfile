FROM hyperledger/fabric-couchdb:0.4.18

RUN chmod +x /docker-entrypoint.sh \
 && chown -R couchdb:couchdb /opt/couchdb/etc/default.d/ /opt/couchdb/etc/vm.args \
 && chmod -R 0770 /opt/couchdb/data \
 && chmod 664 /opt/couchdb/etc/*.ini \
 && chmod 664 /opt/couchdb/etc/default.d/*.ini \
 && chmod 775 /opt/couchdb/etc/*.d

WORKDIR /opt/couchdb
EXPOSE 5984 4369 9100

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["/opt/couchdb/bin/couchdb"]


#--> mit couchdb:couchdb probieren