IMAGE=ubuntu-dev
CONTAINER=$IMAGE
SHARED=data

docker run -d \
  -v $PWD/$SHARED:/$SHARED \
  -p 2222:22 \
  --name ubuntu-dev \
  ubuntu-dev \
  bash /var/provisioning/ubuntu-dev-start.sh

