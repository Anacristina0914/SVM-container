FROM ubuntu
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y libsvm-tools
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
#RUN apt install -y python3-pip
#RUN pip3 install numpy
#RUN pip3 install pandas
RUN apt install -y vim
CMD [ "/bin/bash", "-c", "time svm-train -t 2 -c 1.5 -g 0.25 /home/svm_data/SVMTrain.txt /home/svm_data/SVMModel.txt" ]
