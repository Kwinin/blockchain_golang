#!/bin/bash
#在.goreleaser.yaml中的添加
#-running go mod download 之前添加一下内容，再执行compile.sh
#-go env -w GOPROXY=https://goproxy.cn,direct

org="Kwinin"
repo="blockchain_golang"

set +x
docker run --rm --privileged \
-v $PWD:/go/src/github.com/$org/$repo \
-v /var/run/docker.sock:/var/run/docker.sock \
-w /go/src/github.com/$org/$repo \
mailchain/goreleaser-xcgo --snapshot --rm-dist
set -x