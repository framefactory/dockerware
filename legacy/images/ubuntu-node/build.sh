IMAGE=ubuntu-node
CONTAINER=$IMAGE
docker build -f $IMAGE.dockerfile -t $IMAGE .

