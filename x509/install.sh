#!/bin/bash

set -eu -o pipefail
shopt -s failglob

cp -a $(go env GOROOT)/src/crypto/x509/* ./

sed -i "s/Elliptic.Unmarshal(/Elliptic.UnmarshalCompressed(/g" ./*.go
sed -i "s/Elliptic.Marshal(/Elliptic.MarshalCompressed(/g" ./*.go

rm ./*_test.go
