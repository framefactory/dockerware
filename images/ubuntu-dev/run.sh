docker run -d `
  -v ~/docker/images/ubuntu-dev/data:/data `
  -p 2222:22 `
  --name ubuntu-dev `
  ubuntu-dev `
  bash /var/provisioning/ubuntu-dev-start.sh