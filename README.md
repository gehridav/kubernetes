# Kubernetes

## Kong
Kong is used as Kubernetes Ingress controller. It exposes the kubernetes services to the external environment.

## Cert-Manager
Cert manager is used to manage tls certificates, in this case with letsencrypt as ACME service, using the dns01 verification path with Azure DNS.
