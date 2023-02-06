# get python version as default docker image

FROM python:3.8-slim

ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION=1.3.2 \
    DEBUG=True
    
# set python default path
ENV PYTHONPATH=${PYTHONPATH}:${PWD} 

ARG PROJECT_ON_IMAGE=/usr/src/app
ARG PROJECT_ROOT=./app

# System deps:
RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    bash \
    build-essential \
    curl \
    gettext \
    git \
    libpq-dev \
    wget
  # Cleaning cache and install poetry
RUN apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
	&& pip3 install poetry==$POETRY_VERSION && poetry -V

# makedir in docker container and copy needed files into it.
RUN mkdir ${PROJECT_ON_IMAGE}

WORKDIR ${PROJECT_ON_IMAGE}
COPY ./pyproject.toml .

# set poetry to not create another venv, so poetry use container venv
RUN poetry config virtualenvs.create false
RUN poetry install $(test ${DEBUG} == True && echo "--no-dev") --no-interaction --no-ansi

# COPY ${PROJECT_ROOT} .