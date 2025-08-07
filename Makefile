BPF_CLANG=clang
BPF_CFLAGS=-O2 -g -Wall -target bpf -D__TARGET_ARCH_x86 -I/usr/include

all:
	$(BPF_CLANG) $(BPF_CFLAGS) -c bpf/hello.bpf.c -o hello.bpf.o
	go build -o cmd/main ./cmd

build-apply:
	kind delete cluster --name ebpf-sample
	kind create cluster --name ebpf-sample
	docker buildx build --platform=linux/amd64 --load -t ebpf-sample .
	kind load docker-image ebpf-sample --name ebpf-sample
	kubectl apply -f k8s/deploy.yaml
	kubectl get pods
