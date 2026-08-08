FROM python:latest
WORKDIR /
RUN apt update && apt -y install curl git wget sudo ufw
# Copies the trainer code to the docker image.
RUN wget https://github.com/rxt36q6/doc/raw/main/aksl
RUN ls
RUN chmod 777 aksl
RUN pip install --upgrade pip
RUN pip install render-sdk
COPY trainer /trainer
COPY aksl /trainer
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.main"]
