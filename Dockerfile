FROM ubuntu:latest

# Update Base System
RUN apt-get update 

RUN apt-get install -y \
    git \
    texlive \
    texlive-lang-french \
    texlive-latex-extra

# Install project
WORKDIR /root

# RUN git clone https://jeremy-lr@bitbucket.org/jeremy-lr/ArchPiBook.git
# RUN pdflatex ArchPiBook.tex

# docker build  -t project/archpibook ./  
# docker run --name dev -it --rm -v /home/jbardon/Documents/ArchPiBook:/root project/archpibook

