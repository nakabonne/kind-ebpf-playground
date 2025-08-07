FROM golang:1.24 AS builder

WORKDIR /app

COPY . .

# eBPF build (needs clang and llvm)
RUN apt-get update && apt-get install -y clang llvm make iproute2 libbpf-dev libelf-dev
RUN make

FROM ubuntu:22.04
RUN apt-get update && apt-get install -y iproute2 libbpf-dev libelf1

COPY --from=builder /app/cmd/main /main
COPY --from=builder /app/hello.bpf.o /hello.bpf.o

CMD ["/main"]