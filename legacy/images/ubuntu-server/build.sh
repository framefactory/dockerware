IMAGE=ubuntu-server
CONTAINER=$IMAGE
docker build -f $IMAGE.dockerfile -t $IMAGE .

