# build the image
docker build -f ubuntu-dev.dockerfile -t ubuntu-dev .

$path = $pwd -replace "\\", "/"
$path = $path -replace ":",""

# copy the private key
docker run -ti `
  -v //$path/key:/key `
  --rm `
  ubuntu-dev `
  cp /root/.ssh/id_rsa /key/ubuntu-dev.pem

# start puttygen to convert the key
puttygen.exe ./key/ubuntu-dev.pem