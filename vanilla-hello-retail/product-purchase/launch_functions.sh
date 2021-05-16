#!/bin/bash

set -ex

pushd ./1.authenticate/
faas-cli $1 -f product-purchase-1-authenticate.yml
popd

pushd ./2.getPrice/
faas-cli $1 -f product-purchase-2-get-price.yml
popd

pushd ./3.authorize-cc/
faas-cli $1 -f product-purchase-authorize-cc.yml
popd

pushd ./4.publish/
faas-cli $1 -f product-purchase-4-publish.yml
popd

sleep 37
