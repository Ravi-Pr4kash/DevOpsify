<<<<<<< HEAD
FROM golang:1.22.5 as base
=======
# Build stage
FROM golang:1.22 AS base
>>>>>>> 8fdd827 (updated)

WORKDIR /app

COPY go.mod .
<<<<<<< HEAD

=======
>>>>>>> 8fdd827 (updated)
RUN go mod download

COPY . .

<<<<<<< HEAD
RUN go build -o main .  

# final stage - Distroless image

FROM gcr.io/distroless/base

COPY --from=base /app/main .

=======
# build for Linux amd64 (compatible with most servers)
RUN GOOS=linux GOARCH=amd64 go build -o /main .

# Final minimal image
FROM gcr.io/distroless/base

COPY --from=base /main /
>>>>>>> 8fdd827 (updated)
COPY --from=base /app/static ./static

EXPOSE 8080

<<<<<<< HEAD
CMD [ "./main" ]
=======
CMD ["/main"]
>>>>>>> 8fdd827 (updated)
