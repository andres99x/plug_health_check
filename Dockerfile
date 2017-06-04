FROM ubuntu:16.04

ENV HOME /root
RUN apt-get update && \
    apt-get install -y \
      automake \
      autoconf \
      curl \
      git \
      libreadline-dev \
      libncurses-dev \
      libssl-dev \
      libyaml-dev \
      libxslt-dev \
      libffi-dev \
      libtool \
      make \
      unixodbc-dev \
      unzip \
      wget && \
    apt-get clean

# Install asdf
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1
ENV PATH $HOME/.asdf/bin:$HOME/.asdf/shims:$PATH

# Install Erlang
ENV ERLANG_VERSION 19.2
RUN asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
    asdf install erlang $ERLANG_VERSION && \
    asdf global erlang $ERLANG_VERSION

# Install Elixir
ENV ELIXIR_VERSION 1.4.4
RUN asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git && \
    asdf install elixir $ELIXIR_VERSION && \
    asdf global elixir $ELIXIR_VERSION

# Remove VM locale warning
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# Setup ElixirApp
ENV APP_HOME /var/www
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
