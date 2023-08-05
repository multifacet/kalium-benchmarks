#!/bin/bash

mkdir -p results_$1
dir=$(pwd)/results_$1

pushd ./productCatalogApi
./run_bench.sh $1 $dir
popd

pushd ./product-photos
./run_bench.sh $1 $dir
popd

pushd ./product-purchase
./run_bench.sh $1 $dir
popd


