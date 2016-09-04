.PHONY: install build test

install:
	go get ./...
	go install ./...

build:
	go build ./...

vet:
	go vet ./...

test: vet
	go test ./...

race-test:
	go test -race -v ./...

release:
	go get github.com/Shyp/bump_version
	bump_version minor types.go

docs:
	go get golang.org/x/tools/cmd/godoc
	(sleep 1; open http://localhost:6060/pkg/github.com/kevinburke/go-types) &
	godoc -http=:6060
