FROM jupyter/datascience-notebook

USER root

# 必要なライブラリのインストール
RUN pip install --upgrade ipython beautifulsoup4 lxml html5lib seaborn jupytext

# 黒色の背景設定を追加
RUN mkdir -p /home/jovyan/.jupyter/lab/user-settings/@jupyterlab/apputils-extension
RUN echo '{"theme":"JupyterLab Dark"}' > \
  /home/jovyan/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings

# notebooksdディレクトリの作成
RUN mkdir /home/jovyan/notebooks
RUN chown jovyan:users /home/jovyan/notebooks

USER jovyan
WORKDIR /home/jovyan
