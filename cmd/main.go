package main

import (
	"log"

	"github.com/cilium/ebpf"
	"github.com/cilium/ebpf/link"
)

func main() {
	spec, err := ebpf.LoadCollectionSpec("hello.bpf.o")
	if err != nil {
		log.Fatalf("failed to load spec: %v", err)
	}

	coll, err := ebpf.NewCollection(spec)
	if err != nil {
		log.Fatalf("failed to load collection: %v", err)
	}

	prog := coll.Programs["bpf_prog"]
	if prog == nil {
		log.Fatalf("program not found")
	}

	k, err := link.Kprobe("sys_execve", prog, nil)
	if err != nil {
		log.Fatalf("failed to attach: %v", err)
	}

	defer k.Close()

	log.Println("eBPF program attached. Sleeping...")
	select {}
}
