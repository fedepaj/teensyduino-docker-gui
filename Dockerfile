FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update 
RUN apt-get -y install wget udev libfontconfig xorg openbox build-essential xz-utils 
RUN wget https://downloads.arduino.cc/arduino-1.8.15-linux64.tar.xz
RUN wget https://www.pjrc.com/teensy/td_154/TeensyduinoInstall.linux64
RUN wget https://www.pjrc.com/teensy/00-teensy.rules
RUN cp ./00-teensy.rules /etc/udev/rules.d/
RUN tar -xavf arduino-1.8.15-linux64.tar.xz
RUN chmod 755 TeensyduinoInstall.linux64
RUN ./TeensyduinoInstall.linux64 --dir=arduino-1.8.15

CMD xauth add ${TOKEN} && ./arduino-1.8.15/arduino