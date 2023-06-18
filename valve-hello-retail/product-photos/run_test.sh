#!/bin/bash

set -ex

./launch_functions.sh up

# 1.assign
pushd ./1.assign/
./run_bench.sh 20 valve_20_assign
../stats.py valve_20_assign > valve_20_assign_results
popd

# 1.microbench
pushd ./1.microbench/
./run_bench.sh 20 valve_20_microbench
../stats.py valve_20_microbench > valve_20_microbench_results
popd

# 2.message
pushd ./2.message/
./run_bench.sh 20 valve_20_message
../stats.py valve_20_message > valve_20_message_results
popd

# 2.record
pushd ./2.record/
./run_bench.sh 20 valve_20_record
../stats.py valve_20_record > valve_20_record_results
popd

# 3.receive
pushd ./3.receive/
./run_bench.sh 20 valve_20_receive
../stats.py valve_20_receive > valve_20_receive_results
popd

# 4.success
pushd ./4.success/
./run_bench.sh 20 valve_20_success
../stats.py valve_20_success > valve_20_success_results
popd

# 6.report
pushd ./6.report/
./run_bench.sh 20 valve_20_report
../stats.py valve_20_report > valve_20_report_results
popd

# master-photos
pushd ./master/
./run_bench_photos.sh 20 valve_20_masterPhotos
../stats.py valve_20_masterPhotos > valve_20_masterPhotos_results
popd

# master-receive
pushd ./master/
./run_bench_request.sh 20 valve_20_masterRequest
../stats.py valve_20_masterRequest > valve_20_masterRequest_results
popd

./launch_functions.sh remove

