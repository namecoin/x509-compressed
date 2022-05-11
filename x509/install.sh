#!/bin/bash

set -eu -o pipefail
shopt -s nullglob

cp -a "$(go env GOROOT)/src/crypto/x509"/* ./

sed -i "s/elliptic.Unmarshal(/elliptic.UnmarshalCompressed(/g" ./*.go
sed -i "s/elliptic.Marshal(/elliptic.MarshalCompressed(/g" ./*.go

# These files use an internal package, we provide a skeleton to make it compile
rm -f ./root_darwin_amd64.go ./root_darwin.go

# Avoid importing internal/godebug
sed -i 's|"internal/godebug"||g' ./*.go
sed -i 's/godebug.Get("x509sha1")/"0"/g' ./*.go

# Delete tests if they're present.  (On some distros, e.g. Fedora, they're
# already removed.)
for f in ./*_test.go
do
  rm ./*_test.go
  break
done
