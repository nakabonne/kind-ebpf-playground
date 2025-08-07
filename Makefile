BPF_CLANG=clang
BPF_LLVM=llc
CFLAGS=-O2 -g -Wall -target bpf -D__TARGET_ARCH_x86

all:
	$(BPF_CLANG) $(CFLAGS) -c bpf/hello.bpf.c -o hello.bpf.o
	go build -o cmd/main ./cmd