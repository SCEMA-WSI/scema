FROM mambaorg/micromamba:2.0.3

USER root
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
USER $MAMBA_USER

# Copy and install environment
COPY --chown=$MAMBA_USER:$MAMBA_USER env.yaml /tmp/env.yaml
RUN micromamba install -y -n base -f /tmp/env.yaml && \
    micromamba clean --all --yes

# Ensure PATH is set correctly for micromamba's installed Python
ENV PATH="/opt/conda/bin:$PATH"

COPY --chown=$MAMBA_USER:$MAMBA_USER src/ .
