FROM bitnami/minideb:stretch

ARG DEBIAN_FRONTEND=noninteractive
#RUN apt-get -y update 
RUN install_packages curl udev libfontconfig xorg openbox build-essential xz-utils ca-certificates
RUN curl https://downloads.arduino.cc/arduino-1.8.15-linux64.tar.xz -o arduino-1.8.15-linux64.tar.xz
RUN curl https://www.pjrc.com/teensy/td_154/TeensyduinoInstall.linux64 -o TeensyduinoInstall.linux64
RUN curl https://www.pjrc.com/teensy/00-teensy.rules -o 00-teensy.rules
RUN cp ./00-teensy.rules /etc/udev/rules.d/
RUN tar -xavf arduino-1.8.15-linux64.tar.xz
RUN chmod 755 TeensyduinoInstall.linux64
RUN ./TeensyduinoInstall.linux64 --dir=arduino-1.8.15

CMD ulimit -n 10000 && xauth add ${TOKEN} && ./arduino-1.8.15/arduino