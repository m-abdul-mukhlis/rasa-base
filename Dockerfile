FROM rasa/rasa
USER root
ENV BOT_ENV=production
COPY . /var/www
WORKDIR /var/www
RUN python3 -m venv env
RUN source ./env/bin/activate
RUN pip install --upgrade pip
RUN pip install rasa
RUN rasa train
ENTRYPOINT [ "rasa", "run", "-p", "8080" ]