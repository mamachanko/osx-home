FROM ubuntu:20.10

ENV TZ=Europe/Berlin

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

RUN apt-get update &&\
    apt-get upgrade -y

RUN apt-get install -y \
      curl \
      neovim \
      tmux \
      jq \
      tree \
      git \
      python3 \
      python3-pip \
      golang

RUN pip3 install --user neovim

RUN bash -c '\
      curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    '

ADD vimrc /root/.vimrc
ADD config /root/.config

RUN ALL_PLUGINS='true' nvim --headless +'PlugClean!' +'PlugInstall!' +'qall!'

