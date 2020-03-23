FROM hyperledger/fabric-couchdb:0.4.18

RUN groupadd -g 5984 -r couchdb && useradd -u 5984 -d /opt/couchdb -g couchdb couchdb

RUN chmod +x /docker-entrypoint.sh \
 && chown -R couchdb:couchdb /opt/couchdb/ \
 && chmod -R g+rwx /opt/couchdb/ 

WORKDIR /opt/couchdb
EXPOSE 5984 4369 9100

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["/opt/couchdb/bin/couchdb"]

#--> mit couchdb:couchdb probieren
