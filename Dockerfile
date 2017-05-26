FROM ubuntu:latest

# Update Base System
RUN apt-get update 

RUN apt-get install -y \
    git \
    texlive \
    texlive-lang-french \
    texlive-latex-extra

# Setup SSH connection
# Local: ssh-keygen -t rsa && cp ~/.ssh/id_rsa id_rsa
# Bitbucket: cat ~/.ssh/id_rsa.pub  | xclip -sel clip  
RUN mkdir ~/.ssh
COPY id_rsa /root/.ssh

RUN \
    touch /root/.ssh/known_hosts && \
    ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts && \
    chmod 700 /root/.ssh/id_rsa && \
    chown -R root:root /root/.ssh


# Install project
WORKDIR /root
RUN \
    git clone git@bitbucket.org:jeremy-lr/ArchPiBook.git ArchPiBook && \
    cd /root/ArchPiBook && \
    pdflatex ArchPiBook.tex && \
    echo "echo \"Display projet pdf: ArchPiBook.pdf (in ~/ArchPiBook)\"" >> ~/.bashrc


# docker build  -t project/archpibook ./  
# docker run --name dev -it --rm project/archpibook
# ocker run --name dev -it --rm -v  /home/jbardon/Documents/:/root project/archpibook

