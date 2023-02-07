set -xe

VERSION=1.0.0

docker build -t harbor.k8s.inpt.fr/net7/grr:$VERSION .
docker push harbor.k8s.inpt.fr/net7/grr:$VERSION