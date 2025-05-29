# Start with the latest Ubuntu image 

FROM ubuntu:latest

#Stop Ubuntu from asking questions while installing stuff 

ENV DEBIAN_FRONTEND=noninteractive

# Install the tools I need: cowsay, fortune, and netcat 

RUN apt update && \
    apt install -y cowsay fortune-mod netcat-openbsd && \
    ln -s /usr/games/fortune /usr/local/bin/fortune && \
    ln -s /usr/games/cowsay /usr/local/bin/cowsay && \
    rm -rf /var/lib/apt/lists/*  # clean up to keep the image small

#Make a folder in the container to keep my files 

WORKDIR /app

#Copy my script into the container 

COPY wisecow.sh .

#Give permission to run the script 

RUN chmod +x wisecow.sh

#Open port 4499 so the app can listen on it 

EXPOSE 4499

#Run the script when the container starts 

CMD ["/bin/bash", "-c", "./wisecow.sh && tail -f /dev/null"]


#Adding comment for checking the workflow
