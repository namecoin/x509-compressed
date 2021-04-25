# X.509 with Compressed ECDSA Public Keys

x509-compressed is a fork of the Go standard `crypto/x509` library that uses compressed ECDSA public keys.  Its API is identical to upstream, except that Marshaling ECDSA public keys will result in the compressed form, and Unmarshaling ECDSA public keys will only work if the key is in compressed form.

## Building

Prerequisites:

1. Ensure you have the Go tools installed.

Option A: Using Go build commands without Go modules (works on any platform with Bash; only Go 1.15-1.16.x; will not work on Go 1.17+):

1. Ensure you have the GOPATH environment variable set. (For those not
   familar with Go, setting it to the path to an empty directory will suffice.
   The directory will be filled with build files.)

2. Run `go get -d -t -u github.com/namecoin/x509-compressed/...`. The x509-compressed source code will be
   retrieved automatically.

3. Run `go generate github.com/namecoin/x509-compressed/...`.  Some source code will be generated.

4. You can now `import "github.com/x509-compressed/x509"` from your Go projects.

Option B: Using Go build commands with Go modules (works on any platform with Bash; Go 1.15+:

1. Run the following in the `x509-compressed` directory to set up Go modules:
   
   ~~~
   go mod init github.com/namecoin/x509-compressed
   go mod tidy
   go generate ./...
   go mod tidy
   ~~~

2. Place your application's directory as a sibling of the `x509-compressed` directory.

3. Run the following in your application's directory:
   
   ~~~
   go mod edit -replace github.com/namecoin/x509-compressed=../x509-compressed
   go mod tidy
   ~~~

4. You can now `import "github.com/x509-compressed/x509"` from your Go application.

## Licence

Original Go standard library code Copyright (c) 2009 The Go Authors. All rights reserved.

Compression modifications Copyright (c) 2015-2021 The Namecoin Developers. All rights reserved.

Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
