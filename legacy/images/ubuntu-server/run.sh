IMAGE=ubuntu-server
CONTAINER=$IMAGE
SHARED=www

docker run -d \
  -v $PWD/$SHARED:/data/$SHARED \
  -v ubuntu-server-mysql:/data/mysql \
  -p 2223:22 \
  -p 8080:80 \
  -p 8081:443 \
  --name $CONTAINER \
  $IMAGE \
  bash /var/provisioning/ubuntu-server-start.sh
