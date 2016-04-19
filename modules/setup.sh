#!/bin/bash

set -e

git clone https://github.com/lodash/lodash.git modules/lodash --depth=1
cd modules/lodash
npm install
cd -
