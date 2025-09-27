FROM swift:6.2 AS build

ARG ARCH=x86_64
RUN swift sdk install https://download.swift.org/swift-6.2-release/static-sdk/swift-6.2-RELEASE/swift-6.2-RELEASE_static-linux-0.0.1.artifactbundle.tar.gz \
    --checksum d2225840e592389ca517bbf71652f7003dbf45ac35d1e57d98b9250368769378

WORKDIR /build

COPY ./Package.* ./
RUN swift package resolve
COPY . .

ENV SDK_NAME=${ARCH}-swift-linux-musl
RUN swift build -c release --swift-sdk $SDK_NAME

WORKDIR /staging

RUN cp "$(swift build --package-path /build -c release --swift-sdk $SDK_NAME --show-bin-path)/WebServer" ./

FROM scratch

WORKDIR /app

COPY --from=build --chown=webserver:webserver /staging /app

EXPOSE 8080

ENTRYPOINT ["./WebServer"]
