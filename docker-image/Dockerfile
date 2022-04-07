FROM python:3

COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

WORKDIR /
COPY . /

EXPOSE 5000

ENTRYPOINT [ "python3" ]

CMD [ "server.py" ]
