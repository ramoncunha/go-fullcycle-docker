FROM golang:1.21-rc-alpine3.17 AS builder

WORKDIR /app
ADD . /app
RUN go build -o helloworld

FROM scratch

WORKDIR /app
COPY --from=builder /app/helloworld /app

ENTRYPOINT [ "./helloworld" ]