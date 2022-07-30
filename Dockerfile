# syntax=docker/dockerfile:1
FROM golang:alpine as builder
WORKDIR /build

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./
RUN go build -o awesomeapp

FROM alpine
COPY --from=builder /build/awesomeapp /awesomeapp
CMD ["/awesomeapp"]