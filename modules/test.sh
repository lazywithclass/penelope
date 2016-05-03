#!/bin/bash

set -e

echo mutating...
node index.js
echo mutated!

echo running tests

cd modules/lodash
npm test &>/dev/null
cd - &>/dev/null

cd modules/jsverify
make mocha &>/dev/null
cd - &>/dev/null


RED='\033[0;31m'
GREEN='\033[1;32m'
NC='\033[0m'

if [ $? -ne 0 ]; then
    echo -e "${RED}nok${NC}"
else
    echo -e "${GREEN}ok${NC}"
fi
