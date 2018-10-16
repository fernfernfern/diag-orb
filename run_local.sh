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

circleci config pack orb > local/orbs/diag.yml
circleci config pack local > packed.yml
circleci config process packed.yml > processed.yml