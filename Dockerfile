FROM ubuntu-dev:latest
MAINTAINER qt 2752404195@qq.com
WORKDIR /usr/src
RUN apt update
RUN apt install cron
RUN git clone https://github.com/xp6379/OneGuyAPI.git
WORKDIR /usr/src/OneGuyAPI
RUN pip3 install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple
RUN chmod +x auto_down.sh
RUN crontab auto_down.cron
CMD python3 manage.py runserver 0:80