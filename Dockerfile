FROM bvlc/caffe:gpu

MAINTAINER edclol

USER root

RUN apt update && \
        echo "172.16.1.127  master" >> /etc/hosts && \
        echo "172.16.1.200  work01" >> /etc/hosts && \
        echo "172.16.1.179  work02" >> /etc/hosts && \
        apt install -y git && \
        apt install -y apt-file && \
        apt install -y busybox && \
        rm -rf /var/lib/apt/lists/*

ADD bootstrap.sh /etc/bootstrap.sh
ADD save.py /etc/save.py

ENTRYPOINT ["/etc/bootstrap.sh"]
