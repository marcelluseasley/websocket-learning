FROM golang:1.11.-alpine3.8
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go get -u github.com/golang/dep/cmd/dep
RUN dep ensure
RUN go build -o main ./...
CMD ["/app/main"]