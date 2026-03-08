FROM bluenviron/mediamtx:latest-ffmpeg
COPY mediamtx.yml /mediamtx.yml
EXPOSE 8888
EXPOSE 1935
CMD ["/mediamtx"]
