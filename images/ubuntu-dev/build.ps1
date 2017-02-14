# build the image
docker build -f ubuntu-dev.dockerfile -t ubuntu-dev .

# copy the private key
docker run -ti `
  -v //d/Development/Docker/images/ubuntu-dev/key:/key `
  --rm `
  ubuntu-dev `
  cp /root/.ssh/id_rsa /key/ubuntu-dev.pem

# start puttygen to convert the key
puttygen.exe ./key/ubuntu-dev.pem