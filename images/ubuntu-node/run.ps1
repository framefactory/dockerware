$path = $pwd -replace "\\", "/"
$path = $path -replace ":",""

docker run -d `
  -v //$path/data:/data `
  -p 2224:22 `
  -p 8000:8000 `
  -p 8001:8001 `
  -p 8529:8529 `
  --name ubuntu-node `
  ubuntu-node `
  bash /var/provisioning/ubuntu-node-start.sh