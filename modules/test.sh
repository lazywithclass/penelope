#!/bin/bash

set -e

echo running tests

cd modules/lodash
npm test &>/dev/null
cd - &>/dev/null

cd modules/jsverify
make mocha &>/dev/null
cd - &>/dev/null

cd modules/optimist
npm test &>/dev/null
chttp://49.media.tumblr.com/a5e0913291c65638bc967e11e343d3ad/tumblr_o1zfrxxUBY1r41unfo1_400.gifd - &>/dev/null


RED='\033[0;31m'
GREEN='\033[1;32m'
NC='\033[0m'

if [ $? -ne 0 ]; then
    echo -e "${RED}nok${NC}"
else
    echo -e "${GREEN}ok${NC}"
fi
