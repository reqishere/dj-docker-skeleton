# get python version as default docker image

FROM python:3.8

# makedir in docker container and copy needed files into it.
RUN mkdir /app 
COPY /app /app
COPY pyproject.toml /app 

WORKDIR /app

# set python default path
ENV PYTHONPATH=${PYTHONPATH}:${PWD} 

# installing poetry with pip3
RUN pip3 install poetry

# set poetry to not create another venv, so poetry use container venv
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev