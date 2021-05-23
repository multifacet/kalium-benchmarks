#!/bin/bash

set -ex

./launch_functions.sh up

# 1.assign
pushd ./1.assign/
./run_bench.sh 100 trapeze_$2_assign
../stats.py trapeze_$2_assign > trapeze_$2_assign_results
popd

# 1.microbench
pushd ./1.microbench/
./run_bench.sh 100 trapeze_$2_microbench
../stats.py trapeze_$2_microbench > trapeze_$2_microbench_results
popd

# 2.message
pushd ./2.message/
./run_bench.sh 100 trapeze_$2_message
../stats.py trapeze_$2_message > trapeze_$2_message_results
popd

# 2.record
pushd ./2.record/
./run_bench.sh 100 trapeze_$2_record
../stats.py trapeze_$2_record > trapeze_$2_record_results
popd

# 3.receive
pushd ./3.receive/
./run_bench.sh 100 trapeze_$2_receive
../stats.py trapeze_$2_receive > trapeze_$2_receive_results
popd

# 4.success
pushd ./4.success/
./run_bench.sh 100 trapeze_$2_success
../stats.py trapeze_$2_success > trapeze_$2_success_results
popd

# 6.report
pushd ./6.report/
./run_bench.sh 100 trapeze_$2_report
../stats.py trapeze_$2_report > trapeze_$2_report_results
popd

# master-photos
pushd ./master/
./run_bench_photos.sh 100 trapeze_$2_masterPhotos
../stats.py trapeze_$2_masterPhotos > trapeze_$2_masterPhotos_results
popd

# master-receive
pushd ./master/
./run_bench_receive.sh 100 trapeze_$2_masterReceive
../stats.py trapeze_$2_masterReceive > trapeze_$2_masterReceive_results
popd

./launch_functions.sh remove

