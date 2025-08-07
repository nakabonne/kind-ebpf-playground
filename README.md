# kind-ebpf-playground

## Prerequisites

- Docker (version >= 28.3.2)
- [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation) (version >= v0.29.0)
- Kubectl (version >= v1.33.3)

## Create a cluster

```
kind create cluster --name ebpf-sample
```

```
kubectl get nodes
```

## Build and load the docker image

Build for x86_64 (required for eBPF in kind):

```
docker buildx build --platform=linux/amd64 --load -t ebpf-sample .
```

Load the image into kind cluster:

```
kind load docker-image ebpf-sample --name ebpf-sample
```

Deploy the eBPF pod:

```
kubectl apply -f k8s/deploy.yaml
```

Check the pod status:

```
kubectl get pods
kubectl logs pod/ebpf-sample
```

## Delete the cluster

```
kind delete cluster --name ebpf-sample
```
