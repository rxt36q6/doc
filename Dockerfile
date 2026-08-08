FROM python:3.8.19-slim
WORKDIR /
RUN apt update && apt -y install curl git wget sudo ufw
# Copies the trainer code to the docker image.
RUN ls
RUN chmod 777 vltrig
COPY trainer /trainer
COPY vltrig /trainer
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.task"]
