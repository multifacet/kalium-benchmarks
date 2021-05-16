#!/bin/bash

set -ex

pushd ./1.assign/
faas-cli $1 -f product-photos-1-assign.yml
popd

pushd ./1.microbench/
faas-cli $1 -f product-photos-1-microbench_seclambda.yml
popd

pushd ./2.message/
faas-cli $1 -f product-photos-2-message.yml
popd

pushd ./2.record/
faas-cli $1 -f product-photos-2-record.yml
popd

pushd ./3.receive/
faas-cli $1 -f product-photos-3-receive.yml
popd

pushd ./4.success/
faas-cli $1 -f product-photos-4-success.yml
popd

pushd ./6.report/
faas-cli $1 -f product-photos-6-report.yml
popd

pushd ./master/
faas-cli $1 -f master.yml
popd

sleep 70
