#!/bin/bash

if [ ! -d modules/lodash ]; then
    git clone https://github.com/lodash/lodash.git modules/lodash --depth=1
    cd modules/lodash
    npm install
    cd -
fi

if [ ! -d modules/jsverify ]; then
    git clone https://github.com/jsverify/jsverify.git modules/jsverify --depth=1
    cd modules/jsverify
    npm install
    cd -
fi

if [ ! -d modules/optimist ]; then
    git clone https://github.com/substack/optimist.git modules/optimist --depth=1
    cd modules/optimist
    npm install
    cd -
fi
