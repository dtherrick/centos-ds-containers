FROM centos-ds/base

# Export env settings
ENV TERM=xterm
ENV LANG en_US.UTF-8

ADD /requirements/ /tmp/requirements

RUN pip3.6 install -r /tmp/requirements/requirements2.txt

RUN useradd --create-home --home-dir /home/ds --shell /bin/bash ds
RUN usermod -aG wheel ds

RUN echo "ds ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d
USER ds
RUN mkdir -p /home/ds/data
ENV HOME=/home/ds
ENV SHELL=/bin/bash
ENV USER=ds
VOLUME /home/ds/data
WORKDIR /home/ds/data
