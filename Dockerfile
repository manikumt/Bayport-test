FROM mariadb:latest
EXPOSE 3307
ENV BRUCE=WAYNE
RUN echo "$BRUCE" > /BATCAVE

