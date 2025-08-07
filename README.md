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

## Build the docker image

```
docker build -t ebpf-sample .
```

## Delete the cluster

```
kind delete cluster --name ebpf-sample
```
