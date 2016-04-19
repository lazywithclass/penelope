#!/bin/bash

set -e

git clone https://github.com/lodash/lodash.git --depth=1
cd lodash
npm install
npm test
cd -
