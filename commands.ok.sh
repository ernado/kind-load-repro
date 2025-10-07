set -ex

kind create cluster --config kind.yml
docker pull quay.io/cilium/cilium:v1.18.2
docker pull quay.io/cilium/tetragon-operator:v1.5.0
docker pull quay.io/cilium/operator-generic:v1.18.2
docker pull quay.io/cilium/hubble-ui:v0.13.3
docker pull quay.io/cilium/hubble-ui-backend:v0.13.3
docker pull quay.io/cilium/cilium-envoy:v1.34.7-1757592137-1a52bb680a956879722f48c591a2ca90f7791324
docker pull quay.io/cilium/hubble-relay:v1.18.2
docker pull quay.io/cilium/tetragon:v1.5.0
kind load docker-image --name octo quay.io/cilium/cilium-envoy:v1.34.7-1757592137-1a52bb680a956879722f48c591a2ca90f7791324 quay.io/cilium/cilium:v1.18.2 quay.io/cilium/hubble-relay:v1.18.2 quay.io/cilium/hubble-ui-backend:v0.13.3 quay.io/cilium/hubble-ui:v0.13.3 quay.io/cilium/operator-generic:v1.18.2 quay.io/cilium/tetragon-operator:v1.5.0 quay.io/cilium/tetragon:v1.5.0
helm upgrade cilium cilium/cilium --install --values cilium.yml --namespace cilium --create-namespace --version 1.18.2
