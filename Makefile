BPF_CLANG=clang
BPF_CFLAGS=-O2 -g -Wall -target bpf -D__TARGET_ARCH_x86 -I/usr/include

all:
	$(BPF_CLANG) $(BPF_CFLAGS) -c bpf/hello.bpf.c -o hello.bpf.o
	go build -o cmd/main ./cmd