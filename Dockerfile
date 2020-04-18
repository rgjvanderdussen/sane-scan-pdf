FROM ubuntu:18.04
RUN mkdir /scan
RUN mkdir /out
WORKDIR /scan
COPY . /scan
RUN apt-get update
RUN apt-get upgrade -y
RUN apt install sane sane-utils scanbd git imagemagick supervisor -y

# Sane config
RUN mkdir /etc/scanbd/sane.d/
RUN mkdir -p /etc/scanbd/sane.d/ && cp -r /etc/sane.d/* /etc/scanbd/sane.d/
RUN cp -r /scan/conf/* /etc

# Move script
RUN mkdir /etc/scanbd/scripts
RUN mv /scan/scan.sh /etc/scanbd/scripts/scan.sh

CMD ["/usr/bin/supervisord", "-n"]
