FROM continuumio/miniconda3:4.8.2

RUN apt-get update && apt-get install -y git build-essential
RUN git clone --depth=1 https://github.com/Prunoideae/MitoFlex
RUN cd MitoFlex && \
	git reset --hard 2f1cf458417cc98fa2c5bbd96f818f30ddf22c2a && \
	conda install -c defaults -c bioconda -c conda-forge --file requirements.txt
RUN cd MitoFlex && chmod a+x $(ls *.py)

ENV PATH="/MitoFlex:$PATH"


