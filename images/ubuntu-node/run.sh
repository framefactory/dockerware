IMAGE=ubuntu-node
CONTAINER=$IMAGE
SHARED=data

docker run -d \
  -v //$PWD/$SHARED:/$SHARED \
  -p 2224:22 \
  -p 8000:8000 \
  -p 8001:8001 \
  -p 8529:8529 \
  --name $CONTAINER \
  $IMAGE \
  bash /var/provisioning/ubuntu-node-start.sh

