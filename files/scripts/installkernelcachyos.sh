set -oue pipefail

curl -Lo /etc/yum/repos.d/bieszczaders-kernel-cachyos-fedora-41.repo https://copr.fedorainfracloud.org/coprs/bieszczaders/kernel-cachyos/repo/fedora-41/bieszczaders-kernel-cachyos-fedora-41.repo
sed -i '0,/enabled=1/{s/enabled=1/enabled=1\npriority=90/}' /etc/yum/repos.d/bieszczaders-kernel-cachyos-fedora-41.repo

rpm-ostree override remove \
    kernel \
    kernel-core \
    kernel-modules \
    kernel-modules-core \
    kernel-modules-extra \
  --install  \
    kernel-cachyos
