$path = $pwd -replace "\\", "/"
$path = $path -replace ":",""

docker run -d `
  -v //$path/www:/data/www `
  -v ubuntu-server-mysql:/data/mysql `
  -p 2223:22 `
  -p 8080:80 `
  -p 8081:443 `
  --name ubuntu-server `
  ubuntu-server `
  bash /var/provisioning/ubuntu-server-start.sh