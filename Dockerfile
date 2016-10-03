FROM ubuntu:15.10
MAINTAINER Vinay Dandekar <vindansam@hotmail.com>

ENV SWIFT_VERSION 3.0
ENV SWIFT_PLATFORM_PATH ubuntu1510
ENV SWIFT_PLATFORM ubuntu15.10

RUN apt-get update && apt-get -y install wget clang && apt-get purge -y --auto-remove \
    && wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -
RUN wget https://swift.org/builds/swift-"$SWIFT_VERSION"-release/"$SWIFT_PLATFORM_PATH"/swift-"$SWIFT_VERSION"-RELEASE/swift-"$SWIFT_VERSION"-RELEASE-"$SWIFT_PLATFORM".tar.gz
RUN wget https://swift.org/builds/swift-"$SWIFT_VERSION"-release/"$SWIFT_PLATFORM_PATH"/swift-"$SWIFT_VERSION"-RELEASE/swift-"$SWIFT_VERSION"-RELEASE-"$SWIFT_PLATFORM".tar.gz.sig
RUN gpg --verify swift-"$SWIFT_VERSION"-RELEASE-"$SWIFT_PLATFORM".tar.gz.sig
RUN mkdir -p /usr/src/swift && tar -xzC /usr/src/swift --strip-components=1 -f swift-"$SWIFT_VERSION"-RELEASE-"$SWIFT_PLATFORM".tar.gz
RUN rm swift-"$SWIFT_VERSION"-RELEASE-"$SWIFT_PLATFORM".tar.gz*

CMD ["/usr/src/swift/usr/bin/swift"]
