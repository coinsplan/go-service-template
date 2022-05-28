FROM golang:1.18.0-alpine3.14 AS builder
WORKDIR /build
RUN apk update

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .

RUN go build -o main cmd/app/main.go


FROM alpine:3.14
WORKDIR /app

RUN apk add --no-cache tzdata
# USER fourgle

COPY --from=builder /build/main .
ENV PORT=3000
EXPOSE 3000
CMD ["/app/main"]
