# build the image
docker build -f ubuntu-node.dockerfile -t ubuntu-node .

$path = $pwd -replace "\\", "/"
$path = $path -replace ":",""

# copy the private key
docker run -ti `
  -v //$path/key:/key `
  --rm `
  ubuntu-node `
  cp /root/.ssh/id_rsa /key/ubuntu-node.pem

# start puttygen to convert the key
puttygen.exe ./key/ubuntu-node.pem