FROM bluenviron/mediamtx:latest-ffmpeg
USER root
RUN apk add --no-cache curl
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 8888
EXPOSE 1935
ENTRYPOINT []
CMD ["/start.sh"]
