FROM lsiobase/alpine:3.7

# set version label
# ARG BUILD_DATE
# ARG VERSION
# LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
# LABEL maintainer="sparklyballs"

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
	curl \
	jq \
	openssl \
	p7zip \
	rsync \
	tar \
	unrar \
	unzip && \
 apk add --no-cache \
	--repository http://nl.alpinelinux.org/alpine/edge/main \
	transmission-cli \
	transmission-daemon && \
	wget -O /usr/share/transmission/src.tar.gz https://github.com/ronggang/twc-release/raw/master/src.tar.gz --no-check-certificate && \
	tar -xzf /usr/share/transmission/src.tar.gz -C /usr/share/transmission/web/ && \
	rm -rf /usr/share/transmission/src.tar.gz

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 9091 51413
VOLUME /config /downloads /watch
