from golang:1.16-rc-alpine3.12
WORKDIR /go/app
ENV GO111MODULE=off
RUN set -eux && \
  apk update && \
  apk add --no-cache git curl bash vim && \
  go get -u github.com/cosmtrek/air && \
  go build -o /go/bin/air github.com/cosmtrek/air && \
  go get -u github.com/go-delve/delve/cmd/dlv && \
  go build -o /go/bin/dlv github.com/go-delve/delve/cmd/dlv
ENV GO111MODULE on