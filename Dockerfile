FROM busybox
ADD ./_output/local/bin/linux/amd64/kube-scheduler /usr/local/bin/kube-scheduler
RUN git clone https://github.com/KarypisLab/METIS.git && \
    cd METIS && \
    sudo apt-get install build-essential && \
    sudo apt-get install cmake && \
    make config shared=1 cc=gcc prefix=~/local && \
    make install && \
    cd .. && \
    rm -rf METIS