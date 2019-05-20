FROM golang:1.11 AS builder
RUN mkdir /go/src/app
ADD . /go/src/app
WORKDIR /go/src/app
RUN go get -u github.com/golang/dep/cmd/dep
RUN dep ensure
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./...

FROM alpine:latest AS production
COPY --from=builder /go/src/app .

CMD ["./main"]