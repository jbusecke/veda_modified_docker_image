# Inherit from an upstream image
FROM public.ecr.aws/nasa-veda/pangeo-notebook-veda-image:2024.11.11-v1

USER root

RUN apt-get update -qq --yes > /dev/null && \
    apt-get install --yes -qq \
      build-essential \
      gcc > /dev/null

USER ${NB_USER}

# Install packages
COPY environment.yml /tmp/
RUN mamba env update -p ${CONDA_DIR} -f /tmp/environment.yml && mamba clean -afy
