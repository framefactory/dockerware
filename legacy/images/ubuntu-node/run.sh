IMAGE=ubuntu-node
CONTAINER=$IMAGE
SHARED=data

docker run -d \
  -v //$PWD/$SHARED:/$SHARED \
  -p 80:8000 \
  -p 443:8001 \
  -p 8080:8080 \
  -p 8529:8529 \
  --name $CONTAINER \
  $IMAGE \
  bash /var/provisioning/ubuntu-node-start.sh

