# Docker file for WHO pdf reader
# Author: Cari Gostic
# Date: 2020-02-19

FROM openjdk:8

# System packages 
RUN apt-get update && apt-get install -y curl

# Install miniconda to /miniconda
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda

# Python packages from conda
RUN conda install -c anaconda -y python=3.7.2
RUN conda install -c anaconda -y \
    pip 

# Install tabula-py, PyPDF2 and bs4
RUN pip install tabula-py==1.4.3 && \
    pip install PyPDF2==1.26.0 && \
    pip install bs4==0.0.1

# RUN mkdir /WHO_pdf_reader
# RUN mkdir /WHO_pdf_reader/src
# RUN mkdir /WHO_pdf_reader/results
# ADD read_pdf_url.py /WHO_pdf_reader
# ADD src/parse_functions.py /WHO_pdf_reader/src

#CMD ["python", "WHO_pdf_reader/read_pdf_url.py"]
CMD ["/bin/bash"]

# Sources
    # https://gist.github.com/pangyuteng/f5b00fe63ac31a27be00c56996197597
