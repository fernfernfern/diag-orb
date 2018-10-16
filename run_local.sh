#!/bin/bash

rm -rf local
mkdir -p local/orbs

cat << EOL > local/config.yml
version: 2.1

executors:
  default:
    docker:
      - image: circleci/python

jobs:
  build:
    executor: default
    steps:
      - diag/report
      - diag/create-sample-data
EOL

circleci config pack orb > local/orbs/diag.yml || exit
circleci config pack local > packed.yml || exit
circleci config process packed.yml > processed.yml || exit
circleci build -c processed.yml