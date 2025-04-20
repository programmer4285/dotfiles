#!/usr/bin/env bash

set -e

echo "Installing global Go packages..."

go install github.com/a-h/templ/cmd/templ@latest
go install github.com/air-verse/air@latest
go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest

echo "Done! Make sure \$GOPATH/bin is in your PATH."
