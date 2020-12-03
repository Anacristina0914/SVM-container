FROM ubuntu
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y libsvm-tools
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install -y python3-pip
RUN pip3 install numpy
RUN pip3 install pandas
#Comment
