#!/bin/bash

set -ex

./launch_functions.sh deploy

# 1.assign
pushd ./1.assign/
./run_bench.sh 20 trapeze_20_assign
../stats.py trapeze_20_assign > trapeze_20_assign_results
popd

# 1.microbench
pushd ./1.microbench/
./run_bench.sh 20 trapeze_20_microbench
../stats.py trapeze_20_microbench > trapeze_20_microbench_results
popd

# 2.message
pushd ./2.message/
./run_bench.sh 20 trapeze_20_message
../stats.py trapeze_20_message > trapeze_20_message_results
popd

# 2.record
pushd ./2.record/
./run_bench.sh 20 trapeze_20_record
../stats.py trapeze_20_record > trapeze_20_record_results
popd

# 3.receive
pushd ./3.receive/
./run_bench.sh 20 trapeze_20_receive
../stats.py trapeze_20_receive > trapeze_20_receive_results
popd

# 4.success
pushd ./4.success/
./run_bench.sh 20 trapeze_20_success
../stats.py trapeze_20_success > trapeze_20_success_results
popd

# 6.report
pushd ./6.report/
./run_bench.sh 20 trapeze_20_report
../stats.py trapeze_20_report > trapeze_20_report_results
popd

# master-photos
pushd ./master/
./run_bench_photos.sh 20 trapeze_20_masterPhotos
../stats.py trapeze_20_masterPhotos > trapeze_20_masterPhotos_results
popd

# master-receive
pushd ./master/
./run_bench_receive.sh 20 trapeze_20_masterReceive
../stats.py trapeze_20_masterReceive > trapeze_20_masterReceive_results
popd

./launch_functions.sh remove

