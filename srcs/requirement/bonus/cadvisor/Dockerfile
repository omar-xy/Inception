FROM debian:stable

RUN apt-get update && apt-get install wget -y

RUN wget https://github.com/google/cadvisor/releases/download/v0.39.3/cadvisor && \
    chmod +x cadvisor

ENTRYPOINT [ "./cadvisor" ]
