$path = $pwd -replace "\\", "/"
$path = $path -replace ":",""

docker run -d `
  -v //$path/data:/data `
  -p 2222:22 `
  --name ubuntu-dev `
  ubuntu-dev `
  bash /var/provisioning/ubuntu-dev-start.sh