FROM ollama/ollama AS ollama

FROM cgr.dev/chainguard/wolfi-base

RUN apk add --no-cache libstdc++

COPY --from=ollama /usr/bin/ollama /usr/bin/ollama
COPY --from=ollama /usr/lib/ollama/runners/cpu /usr/lib/ollama/runners/cpu
COPY --from=ollama /usr/lib/ollama/runners/cpu_avx /usr/lib/ollama/runners/cpu_avx
COPY --from=ollama /usr/lib/ollama/runners/cpu_avx2 /usr/lib/ollama/runners/cpu_avx2

# Create the entrypoint script
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# Environment variable setup
ENV OLLAMA_HOST=0.0.0.0

# Expose port for the service
EXPOSE 11434

ENTRYPOINT ["/usr/bin/ollama"]
CMD ["serve"]
