FROM golang:1.16 AS builder
WORKDIR /go/src/app
COPY hello.go .
RUN go build hello.go


FROM scratch
WORKDIR /go/src/app
COPY --from=builder /go/src/app/hello .
ENTRYPOINT ["./hello"]