FROM ubuntu:16.04
MAINTAINER Vinay Dandekar <vindansam@hotmail.com>

ENV SWIFT_VERSION 3.0.2
ENV RELEASE_TYPE RELEASE
ENV RELEASE_TYPE_PATH release
ENV SWIFT_PLATFORM ubuntu16.04
ENV SWIFT_PLATFORM_PATH ubuntu1604

ENV PATH /usr/src/swift/usr/bin:$PATH

RUN apt-get update && apt-get -y install wget clang libpython2.7 libxml2 && apt-get purge -y --auto-remove \
    && wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -
RUN wget https://swift.org/builds/swift-"$SWIFT_VERSION"-"$RELEASE_TYPE_PATH"/"$SWIFT_PLATFORM_PATH"/swift-"$SWIFT_VERSION"-"$RELEASE_TYPE"/swift-"$SWIFT_VERSION"-"$RELEASE_TYPE"-"$SWIFT_PLATFORM".tar.gz \
    && wget https://swift.org/builds/swift-"$SWIFT_VERSION"-"$RELEASE_TYPE_PATH"/"$SWIFT_PLATFORM_PATH"/swift-"$SWIFT_VERSION"-"$RELEASE_TYPE"/swift-"$SWIFT_VERSION"-"$RELEASE_TYPE"-"$SWIFT_PLATFORM".tar.gz.sig \
    && gpg --verify swift-"$SWIFT_VERSION"-"$RELEASE_TYPE"-"$SWIFT_PLATFORM".tar.gz.sig 
RUN mkdir -p /usr/src/swift && tar -xzC /usr/src/swift --strip-components=1 -f swift-"$SWIFT_VERSION"-"$RELEASE_TYPE"-"$SWIFT_PLATFORM".tar.gz \
    && rm swift-"$SWIFT_VERSION"-"$RELEASE_TYPE"-"$SWIFT_PLATFORM".tar.gz.*

CMD ["/usr/src/swift/usr/bin/swift"]