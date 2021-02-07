#!/bin/bash

set -eu -o pipefail
shopt -s failglob

cp -a $(go env GOROOT)/src/crypto/x509/* ./

sed -i "s/elliptic.Unmarshal(/elliptic.UnmarshalCompressed(/g" ./*.go
sed -i "s/elliptic.Marshal(/elliptic.MarshalCompressed(/g" ./*.go

rm ./*_test.go
