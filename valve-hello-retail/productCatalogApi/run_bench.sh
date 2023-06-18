#!/bin/bash

set -ex

./launch_functions.sh deploy

pushd ./api
./run_bench.sh 20 $1
../stats.py $1_20_api_products >> $1_20_api_products_results
../stats.py $1_20_api_categories >> $1_20_api_categories_results
popd

pushd ./builder
./run_bench.sh 20 $1
../stats.py $1_20_builder_product >> $1_20_builder_product_results
../stats.py $1_20_builder_photo >> $1_20_builder_photo_results
popd

./launch_functions.sh remove
