# K8S backup script
# by David Hill 2019
# https://elastisys.com/backup-kubernetes-how-and-why/
# Backup certificates
sudo cp -r /etc/kubernetes/pki /mnt/backup/g-control-plane/k8s/

# Make etcd snapshot
sudo docker run --rm -v /mnt/backup/g-control-plane/k8s:/backup \
--network host \
-v /etc/kubernetes/pki/etcd:/etc/kubernetes/pki/etcd \
--env ETCDCTL_API=3 \
k8s.gcr.io/etcd:3.5.0-0 \
etcdctl --endpoints=https://127.0.0.1:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/healthcheck-client.crt \
--key=/etc/kubernetes/pki/etcd/healthcheck-client.key \
snapshot save /backup/etcd-snapshot-latest.db
