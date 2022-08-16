FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev

RUN apt-get install -y sudo fish vim

RUN apt-get remove -y python3

RUN useradd -m ubuntu
RUN passwd -d ubuntu && usermod -aG sudo ubuntu

USER ubuntu

WORKDIR /home/ubuntu

COPY ./.ssh/ /home/ubuntu/.ssh/

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

RUN curl -L https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

RUN echo 'export PATH="~/.pyenv/bin:$PATH"' >>~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >>~/.bashrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >>~/.bashrc
RUN echo 'source ~/.nvm/nvm.sh' >> ~/.bashrc

RUN sudo apt-get autoremove -y && sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

RUN ["/bin/bash"]