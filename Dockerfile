FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install python -y
RUN apt-get install python-pip -y
RUN pip install --upgrade pip
RUN pip install flask -y
COPY app.py /home/app.py
ENTRYPOINT FLASK_APP=/home/app.py flask run --host=0.0.0.0

