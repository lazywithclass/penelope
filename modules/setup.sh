#!/bin/bash

if [ ! -d modules/lodash ]; then
    git clone https://github.com/lodash/lodash.git modules/lodash --depth=1
    cd modules/lodash
    npm install
    cd -
fi

if [ ! -d modules/ ]; then
    git clone https://github.com/jsverify/jsverify.git modules/jsverify --depth=1
    npm install
    cd -
fi
