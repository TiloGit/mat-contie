FROM alpine:latest AS unzipper
RUN apk add unzip wget curl
WORKDIR /opt
RUN curl -L "https://www.eclipse.org/downloads/download.php?file=/mat/1.15.0/rcp/MemoryAnalyzer-1.15.0.20231206-linux.gtk.x86_64.zip&r=1" --output mat.zip
RUN unzip mat.zip


FROM eclipse-temurin:17-jdk-jammy
WORKDIR /opt
COPY --from=unzipper /opt/mat /opt/mat
COPY run.sh ./mat
RUN chmod +x ./mat/run.sh
WORKDIR /data
ENTRYPOINT ["/opt/mat/run.sh"]