FROM alpine

RUN wget -O - https://ollama.com/download/ollama-linux-amd64.tgz | |tar -xz -C /usr/local/bin --strip-components=2 ./bin/ollama

ENV OLLAMA_HOST=0.0.0.0
EXPOSE 11434

ENTRYPOINT ["/usr/local/bin/ollama"]
CMD ["serve"]
