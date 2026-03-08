FROM bluenviron/mediamtx:latest-ffmpeg
COPY mediamtx.yml /mediamtx.yml
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 8888
EXPOSE 1935
ENTRYPOINT []
CMD ["/bin/sh", "/start.sh"]
