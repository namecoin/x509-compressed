#!/bin/bash

set -eu -o pipefail
shopt -s nullglob

cp -a "$(go env GOROOT)/src/crypto/x509"/* ./

sed -i "s/elliptic.Unmarshal(/elliptic.UnmarshalCompressed(/g" ./*.go
sed -i "s/elliptic.Marshal(/elliptic.MarshalCompressed(/g" ./*.go

# These files use an internal package, we provide a skeleton to make it compile
rm -f ./root_darwin_amd64.go ./root_darwin.go

# Replace un-importable internal/godebug with a stub
find . -name "*.go" -type f -exec \
  sed -i 's|"internal/godebug"|"github.com/namecoin/x509-compressed/godebug"|g' {} \;

# Delete tests if they're present.  (On some distros, e.g. Fedora, they're
# already removed.)
for f in ./*_test.go
do
  rm ./*_test.go
  break
done
