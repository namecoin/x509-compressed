# X.509 with Compressed ECDSA Public Keys

x509-compressed is a fork of the Go standard `crypto/x509` library that uses compressed ECDSA public keys.  Its API is identical to upstream, except that Marshaling ECDSA public keys will result in the compressed form, and Unmarshaling ECDSA public keys will only work if the key is in compressed form.

## Building

Prerequisites:

1. Ensure you have the Go tools installed.

Option A: Using Go build commands (works on any platform with Bash):

1. Ensure you have the GOPATH environment variable set. (For those not
   familar with Go, setting it to the path to an empty directory will suffice.
   The directory will be filled with build files.)

2. Run `go get -d -t -u github.com/namecoin/x509-compressed/...`. The x509-compressed source code will be
   retrieved automatically.

3. Run `go generate github.com/namecoin/x509-compressed/...`.  Some source code will be generated.

4. You can now `import "github.com/x509-compressed/x509"` from your Go projects.

## Licence

Original Go standard library code Copyright (c) 2009 The Go Authors. All rights reserved.

Compression modifications Copyright (c) 2015-2021 The Namecoin Developers. All rights reserved.

Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
