IMAGE=ubuntu-dev
CONTAINER=$IMAGE
docker build -f $IMAGE.dockerfile -t $IMAGE .

