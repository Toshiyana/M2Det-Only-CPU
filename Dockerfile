FROM ubuntu:18.04
USER root

# Upgrade installed packages
RUN apt-get update && apt-get upgrade -y && apt-get clean
# Python package management and basic dependencies
RUN apt-get install -y curl python3.7 python3.7-dev python3.7-distutils
# Register the version in alternatives
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1
# Set python 3 as the default python
RUN update-alternatives --set python /usr/bin/python3.7
# Upgrade pip to latest version
RUN curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py --force-reinstall && \
    rm get-pip.py

# RUN apt-get update && \
#         apt-get install -y software-properties-common && \
#         add-apt-repository ppa:deadsnakes/ppa && \
#         apt-get update -y  && \
#         apt-get install -y build-essential python3.6 python3.6-dev python3-pip && \
#         apt-get install -y git  && \
#         # update pip
#         python3.6 -m pip install pip --upgrade && \
#         python3.6 -m pip install wheel

# pythonの標準出力、エラー出力をバッファにため込まないための設定
ENV PYTHONUNBUFFERED 1

# コンテナ内はデフォルト状態だと言語設定が全くないため日本語が文字化けするので、以下のコマンドを実行。
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN mkdir /code
ADD . /code
# 作業ディレクトリをcodeディレクトリに移動
WORKDIR /code

RUN apt-get install -y vim less
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools

RUN pip install -r requirements.txt
# RUN pip install --trusted-host pypi.python.org -r requirements.txt