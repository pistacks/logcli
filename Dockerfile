FROM pistacks/alpine AS builder

RUN wget --output-document /logcli.zip https://github.com/grafana/loki/releases/download/v1.3.0/logcli-linux-arm.zip
RUN unzip /logcli.zip && mv logcli-linux-arm /bin/logcli && rm -rf /logcli.zip

FROM pistacks/busybox
COPY --from=builder /bin/logcli /bin/logcli

ENTRYPOINT ["/bin/logcli"]
