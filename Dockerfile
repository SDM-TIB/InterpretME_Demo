FROM jupyter/base-notebook:python-3.9.13

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

USER root
RUN userdel -r jovyan && \
    adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
USER ${NB_USER}

COPY requirements.txt ${HOME}/requirements.txt
COPY InterpretME_Demo.ipynb ${HOME}/InterpretME_Demo.ipynb
COPY example_jupyter.json ${HOME}/example_jupyter.json
COPY shapes ${HOME}/shapes
COPY images ${HOME}/images


USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends graphviz && \
    rm -rf /var/lib/apt/lists/*  && \
    chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

RUN python3 -m pip install --no-cache-dir -r /home/jovyan/requirements.txt
