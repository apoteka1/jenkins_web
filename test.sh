#!/bin/bash

BUILD_NUMBER="${1}"

cat ./index.html | grep "Deployed by Jenkins job ${BUILD_NUMBER}"