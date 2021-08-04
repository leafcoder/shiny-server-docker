FROM ubuntu:14.04

LABEL maintainer="leafcoder"

EXPOSE 3838

RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get install -y wget \
&& wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc \
&& apt-get install -y software-properties-common dirmngr \
&& gpg --keyserver keyserver.ubuntu.com --recv-key E298A3A825C0D65DFD57CBB651716619E084DAB9 \
&& gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | apt-key add - \
&& add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)/" \
&& wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.16.958-amd64.deb

RUN apt-get update \
&& apt-get install -y r-base \
&& apt-get install -y gdebi-core \
&& apt-get install -y openssl libssl-dev libcurl4-openssl-dev

RUN R -e "install.packages('shiny')"

RUN R -e "packageurl <- \"https://cran.r-project.org/src/contrib/Archive/stringi/stringi_1.1.7.tar.gz\"; \
install.packages(packageurl, repos=NULL, type=\"source\")"

RUN R -e "install.packages('rmarkdown', dependencies=TRUE)"

RUN gdebi -n shiny-server-1.5.16.958-amd64.deb \
&& rm shiny-server-1.5.16.958-amd64.deb

CMD ["shiny-server"]
