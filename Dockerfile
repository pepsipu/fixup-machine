FROM ubuntu:impish

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy \
    python3 python3-pip python3-dev \
    git \
    libssl-dev libffi-dev build-essential \
    gdb \
    wget curl tmux vim \
    zsh \
    ruby \
    gcc \
    gdbserver \
    tmux \
    elfutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN python3 -m pip install --no-cache-dir --upgrade pip pwntools && \
    gem install one_gadget && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh 

RUN wget -q -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
RUN chsh -s /bin/zsh

ENV LANG C.UTF-8

COPY bin/flag.txt /flag.txt
COPY install/* /
RUN mkdir -p /root/.cache
WORKDIR /pwn
# COPY bin/nightmare nightmare


CMD ["/bin/zsh"]