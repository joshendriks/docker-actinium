#!/bin/bash

cat  << EOF
rpcuser=$USER
rpcpassword=$PASSWORD
rpcallowip=$RPCALLOW
txindex=1
listen=1
server=1
rest=1
port=4334
rpcport=5335
addnode=104.156.231.46:4334
addnode=45.63.92.210:4334
addnode=140.82.36.38:4334

EOF