########################################################################################################################
FROM ubuntu as BASE

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
WORKDIR /root
RUN ln -sfn /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN DEBIAN_FRONTEND=noninteractive apt-get -q -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -q -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends apt-utils

RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends tzdata

RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends apt-file

RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends build-essential make exuberant-ctags
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends cmake

RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends wget curl

RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends git tig
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends less file

RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends host net-tools netcat inetutils-ping lsof man psmisc tree
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends postgresql-client

RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends ca-certificates
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends sudo
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends gnupg2

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN DEBIAN_FRONTEND=noninteractive apt-get -q -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends nodejs npm yarn

RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends tmux tmate

RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends zsh zsh-dev zsh-doc

RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends neovim

# python 2
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends python-pip
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends python-greenlet python-msgpack python-setuptools
RUN pip2 install wheel neovim

# pyuthon 3
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends python3 python3-pip
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends python3-greenlet python3-msgpack python3-setuptools
RUN pip3 install wheel neovim

# ruby
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends ruby-dev
RUN gem install neovim

# node
RUN yarn global add neovim

RUN apt-file update

CMD ["/bin/zsh"]

## FZF ###########################################################################
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install --no-update-rc --no-bash --no-fish --completion --key-bindings

RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends taskwarrior

########################################################################################################################

FROM BASE

COPY . build

RUN cd build/zsh && make install
RUN cd build/vim && make install


# ARG DOTVIM_VERSION
# ARG DOTZSH_VERSION
# ARG DOTFILES_VERSION


## ## VIM ###################################################################################################################
## COPY nvim/init.vim /.config/nvim/init.vim
## RUN git clone --depth 1 --branch local https://github.com/vitaly/dotvim3.git ~/.vim \
##       && cd /.vim && git rev-parse ${DOTVIM_VERSION}
##       && cd ~/.vim \
##       && make install


## ## DOTFILES `#############################################################################################################
## RUN git clone --depth 1 --branch local https://github.com/vitaly/dotfiles.git /.dot \
##       && cd /.dot && git rev-parse ${DOTFILES_VERSION}
##
## ## TMUX ##################################################################################################################
## # plugins install must run from within tmux, so we start a detached tmux session, then wait for it
## RUN cd /.dot/tmux && tmux new-session -s 'install' -c /.dot/tmux -d make && tmux wait install
##
## ## ZSH ###################################################################################################################
## RUN git clone --depth=1 --branch local https://github.com/vitaly/oh-my-zsh.git /.zsh \
##                       && cd /.zsh && git rev-parse ${DOTZSH_VERSION}
##
## RUN ln -sfn  .zsh/zshrc /.zshrc
##
## ##########################################################################################################################
