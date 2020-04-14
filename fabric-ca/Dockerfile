FROM hyperledger/fabric-ca:1.4

RUN chown -R :0 /etc/hyperledger \
 && chmod -R a+w /etc/hyperledger

EXPOSE 30330

CMD fabric-ca-server start -b admin:adminpw -d