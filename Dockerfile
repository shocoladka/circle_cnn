FROM tensorflow/tensorflow:2.0.0-py3-jupyter

COPY requirements.txt /tf/requirements.txt
RUN pip install -r requirements.txt

RUN apt-get update && apt-get install git-core -y
# Install vim plugin for jupyter.
RUN mkdir -p $(jupyter --data-dir)/nbextensions \
      && cd $(jupyter --data-dir)/nbextensions \
      && git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding \
      && jupyter nbextension enable vim_binding/vim_binding

ENV PYTHONPATH=$PYTHONPATH:/tf
