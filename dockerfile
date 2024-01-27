FROM nginx


RUN apt-get update         # If necessary
RUN apt-get install sudo   # If your base image does not contain sudo.
RUN useradd -m -N -s /bin/bash -u 1000 -p '$1$miTOHCYy$K.c4Yw.edukWJ7z9rbpTZ0' container && \
    usermod -aG sudo container  # Grant sudo to the user
USER container

ENV  USER=container HOME=/home/container
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
