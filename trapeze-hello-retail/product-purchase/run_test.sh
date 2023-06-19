#!/bin/bash

set -ex

./launch_functions.sh up

# 1.autheticate
pushd ./1.authenticate/
./run_bench.sh 20 trapeze_$1_authenticate
../stats.py trapeze_$1_authenticate > trapeze_$1_authenticate_results
popd

# 2.getPrice
pushd ./2.getPrice/
./run_bench.sh 20 trapeze_$1_getPrice
../stats.py trapeze_$1_getPrice > trapeze_$2_getPrice_results
popd

# 3.authorize-cc
pushd ./3.authorize-cc/
./run_bench.sh 20 trapeze_$2_authorize-cc
../stats.py trapeze_$2_authorize-cc > trapeze_$2_authorize-cc_results
popd

# 4.publish
pushd ./4.publish/
./run_bench.sh 20 trapeze_$2_publish
../stats.py trapeze_$2_publish > trapeze_$2_publish_results
popd

./launch_functions.sh remove
