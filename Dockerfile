FROM golang:alpine AS jsonnet

RUN \
apk add --no-cache git \
&& go get -v github.com/google/go-jsonnet/cmd/jsonnet

FROM hashicorp/terraform:0.11.13

COPY --from=jsonnet /go/bin/jsonnet /usr/local/bin/

RUN \
apk add --no-cache make \
&& chmod a+x /usr/local/bin/jsonnet
