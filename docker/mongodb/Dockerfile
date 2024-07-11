# Gunakan base image Alpine 3.20
FROM alpine:3.20

# Set metadata labels
LABEL maintainer="Firhan Ali <alifirhan.fa@gmail.com>"
LABEL description="Customized image for business purposes developed by Firhan Ali."

# Set environment variables untuk MongoDB
ENV MONGO_VERSION 8.0.0
ENV MONGO_PACKAGE mongodb-${MONGO_VERSION}

# Install MongoDB dan alat pendukung lainnya
RUN apk update && \
    apk add --no-cache \
    ${MONGO_PACKAGE} \
    mongodb-tools \
    su-exec && \
    rm -rf /var/cache/apk/*

# Buat direktori data untuk MongoDB
RUN mkdir -p /data/db /data/configdb && \
    chown -R mongodb:mongodb /data/db /data/configdb

# Set volume untuk data dan konfigurasi
VOLUME /data/db /data/configdb

# Expose port MongoDB
EXPOSE 27017

# Gunakan skrip entrypoint untuk menjalankan MongoDB dengan user mongodb
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Jalankan MongoDB menggunakan skrip entrypoint
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mongod", "--bind_ip_all"]