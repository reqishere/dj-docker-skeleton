developing with python installed throught your system
1. install poetry for python on how to install it, go to this docs: ```https://python-poetry.org/docs/```
2. after installing the poetry, go install needed packages for skeleton with cmd ```cd to-your-cloned-git``` then ```poetry install```
3. dont forget to duplicate ```app/app/.env.example``` to ```app/app/.env``` and edit .env to your config
4. then run the runserver with ```poet_runserver.bat```, then open ```http://localhost:8000``` on your browser. and thats it...

install inside docker container
1. install docker, go read docs ```https://docs.docker.com/get-docker/```
2. (optional) if you install inside linux server, you need to install docker-compose first. you can use my script if u have to ```./install.docker-compose.sh```
3. ---still on development---