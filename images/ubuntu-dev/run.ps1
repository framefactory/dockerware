docker run -d `
  -v //d/Development/Docker/images/ubuntu-dev/data:/data `
  -p 2222:22 `
  --name ubuntu-dev `
  ubuntu-dev `
  bash /var/provisioning/ubuntu-dev-start.sh