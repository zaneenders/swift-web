# swift-web

```console
# Build for x86_64
docker build --build-arg ARCH=x86_64 -t swift-web:x86_64 .

# Build for ARM64
docker build --build-arg ARCH=aarch64 -t swift-web:arm64 .

docker compose up
```