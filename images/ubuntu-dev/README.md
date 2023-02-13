# Ubuntu 22.04 Development Image
### Description
Ubuntu Server 22.04 with development and build tools

### Build Image
```
docker build -t framefactory/ubuntu-dev:22.04 .
docker tag framefactory/ubuntu-dev:22.04 framefactory/ubuntu-dev:latest
docker login
docker push framefactory/ubuntu-dev:<tag>
```

### Default user
- Creates and sets as default a user `main` with UID `1000`

### Installed Packages
- curl, wget, vim, git, dos2unix
- build essentials
- ca-certificates
- libssl-dev
- python3, python3-pip, python-is-python3
