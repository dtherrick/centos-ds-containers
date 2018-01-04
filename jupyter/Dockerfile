#!/usr/bin/env bash

FROM centos-ds/base

# Export env settings
ENV TERM=xterm
ENV LANG en_US.UTF-8

ADD /requirements/ /tmp/requirements

RUN pip3.6 install -r /tmp/requirements/requirements.txt

RUN useradd --create-home --home-dir /home/ds --shell /bin/bash ds
RUN usermod -aG wheel ds

ADD run_ipython.sh /home/ds
RUN chmod +x /home/ds/run_ipython.sh
RUN chown ds /home/ds/run_ipython.sh

RUN jupyter-nbextension install rise --py --sys-prefix
RUN jupyter-nbextension enable rise --py --sys-prefix

EXPOSE 8888
RUN echo "ds ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d
USER ds
RUN mkdir -p /home/ds/notebooks
RUN mkdir -p /home/ds/.jupyter
RUN echo "c.NotebookApp.token = u''" >> /home/ds/.jupyter/jupyter_notebook_config.py
ENV HOME=/home/ds
ENV SHELL=/bin/bash
ENV USER=ds
VOLUME /home/ds/notebooks
WORKDIR /home/ds/notebooks

CMD ["/home/ds/run_ipython.sh"]
