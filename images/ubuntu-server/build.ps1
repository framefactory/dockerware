# build the image
docker build -f ubuntu-server.dockerfile -t ubuntu-server .

# copy the private key
docker run -ti `
  -v //d/Development/Docker/images/ubuntu-server/key:/key `
  --rm `
  ubuntu-server `
  cp /root/.ssh/id_rsa /key/ubuntu-server.pem

# start puttygen to convert the key
puttygen.exe ./key/ubuntu-server.pem