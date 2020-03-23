FROM hyperledger/fabric-couchdb:0.4.18


RUN chmod +x /docker-entrypoint.sh \
 && chown -R :0 /opt/couchdb/ \
 && chmod -R a+w /opt/couchdb/ 

WORKDIR /opt/couchdb
EXPOSE 5984 4369 9100

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["/opt/couchdb/bin/couchdb"]

#--> mit couchdb:couchdb probieren
