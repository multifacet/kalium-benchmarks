#!/bin/bash

set -ex

./launch_functions.sh up

# 1.autheticate
pushd ./1.authenticate/
./run_bench.sh 100 seclambda_$1_authenticate
../stats.py seclambda_$1_authenticate > seclambda_$1_authenticate_results
popd

# 2.getPrice
pushd ./2.getPrice/
./run_bench.sh 100 seclambda_$1_getPrice
../stats.py seclambda_$1_getPrice > seclambda_$2_getPrice_results
popd

# 3.authorize-cc
pushd ./3.authorize-cc/
./run_bench.sh 100 seclambda_$2_authorize-cc
../stats.py seclambda_$2_authorize-cc > seclambda_$2_authorize-cc_results
popd

# 4.publish
pushd ./4.publish/
./run_bench.sh 100 seclambda_$2_publish
../stats.py seclambda_$2_publish > seclambda_$2_publish_results
popd

./launch_functions.sh remove
