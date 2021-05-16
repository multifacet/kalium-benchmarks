#!/bin/bash

set -ex

./launch_functions.sh up

# 1.assign
pushd ./1.assign/
./run_bench.sh 100 seclambda_$2_assign
../stats.py seclambda_$2_assign > seclambda_$2_assign_results
popd

# 1.microbench
pushd ./1.microbench/
./run_bench.sh 100 seclambda_$2_microbench
../stats.py seclambda_$2_microbench > seclambda_$2_microbench_results
popd

# 2.message
pushd ./2.message/
./run_bench.sh 100 seclambda_$2_message
../stats.py seclambda_$2_message > seclambda_$2_message_results
popd

# 2.record
pushd ./2.record/
./run_bench.sh 100 seclambda_$2_record
../stats.py seclambda_$2_record > seclambda_$2_record_results
popd

# 3.receive
pushd ./3.receive/
./run_bench.sh 100 seclambda_$2_receive
../stats.py seclambda_$2_receive > seclambda_$2_receive_results
popd

# 4.success
pushd ./4.success/
./run_bench.sh 100 seclambda_$2_success
../stats.py seclambda_$2_success > seclambda_$2_success_results
popd

# 6.report
pushd ./6.report/
./run_bench.sh 100 seclambda_$2_report
../stats.py seclambda_$2_report > seclambda_$2_report_results
popd

# master-photos
pushd ./master/
./run_bench_photos.sh 100 seclambda_$2_masterPhotos
../stats.py seclambda_$2_masterPhotos > seclambda_$2_masterPhotos_results
popd

# master-receive
pushd ./master/
./run_bench_receive.sh 100 seclambda_$2_masterReceive
../stats.py seclambda_$2_masterReceive > seclambda_$2_masterReceive_results
popd

./launch_functions.sh remove

