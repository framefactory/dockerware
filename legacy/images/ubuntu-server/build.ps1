# build the image
docker build -f ubuntu-server.dockerfile -t ubuntu-server .

$path = $pwd -replace "\\", "/"
$path = $path -replace ":",""

# copy the private key
docker run -ti `
  -v //$path/key:/key `
  --rm `
  ubuntu-server `
  cp /root/.ssh/id_rsa /key/ubuntu-server.pem

# start puttygen to convert the key
puttygen.exe ./key/ubuntu-server.pem