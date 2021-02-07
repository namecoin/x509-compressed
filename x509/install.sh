#!/bin/bash

set -eu -o pipefail
shopt -s failglob

cp -a $(go env GOROOT)/src/crypto/x509/* ./

sed -i "s/elliptic.Unmarshal(/elliptic.UnmarshalCompressed(/g" ./*.go
sed -i "s/elliptic.Marshal(/elliptic.MarshalCompressed(/g" ./*.go

# These files use an internal package, we provide a skeleton to make it compile
rm -f ./root_darwin_amd64.go ./root_darwin.go

rm ./*_test.go
