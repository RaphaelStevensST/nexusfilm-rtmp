FROM bluenviron/mediamtx:latest-ffmpeg
USER root
RUN apk add --no-cache curl
COPY mediamtx.yml /mediamtx.yml
EXPOSE 8888
EXPOSE 1935
ENTRYPOINT []
CMD ["/mediamtx"]
