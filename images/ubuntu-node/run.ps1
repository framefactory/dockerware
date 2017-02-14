docker run -d `
  -v //d/Development/Docker/images/ubuntu-node/data:/data `
  -p 2224:22 `
  -p 8000:8000 `
  -p 8001:8001 `
  --name ubuntu-node `
  ubuntu-node `
  bash /var/provisioning/ubuntu-node-start.sh