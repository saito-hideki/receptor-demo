#!/bin/sh

source ./bootstrap-env.sh

mkdir -p certs
receptor --cert-init commonname="test CA" bits=2048 outcert=certs/ca.crt outkey=certs/ca.key
for node in $RECEPTOR_NODES; do
  receptor --cert-makereq bits=2048 commonname="$node test cert" dnsname=localhost nodeid=$node outreq=certs/testcert-$node.csr outkey=certs/testcert-$node.key
  receptor --cert-signreq req=certs/testcert-$node.csr cacert=certs/ca.crt cakey=certs/ca.key outcert=certs/testcert-$node.crt
done

#
# [EOF]
#
