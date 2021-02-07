#!/bin/bash

set -eu -o pipefail
shopt -s failglob

cp -a $(go env GOROOT)/src/crypto/x509/* ./

sed -i "s/elliptic.Unmarshal(/elliptic.UnmarshalCompressed(/g" ./*.go
sed -i "s/elliptic.Marshal(/elliptic.MarshalCompressed(/g" ./*.go
sed -i 's|"crypto/x509/internal|"github.com/namecoin/x509-compressed/x509/internal|g' ./*.go

rm ./*_test.go
