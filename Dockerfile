FROM docker.io/ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential git && \
    apt-get install -y wpasupplicant wireless-tools hostapd rfkill

RUN git clone https://github.com/Myria-de/mt7610u_wifi_sta_v3002_dpo_20130916.git && \
    cd mt7610u_wifi_sta_v3002_dpo_20130916 && \
	make && \
	make install && \
	mkdir -p /etc/Wireless/RT2870STA && \
	cp RT2870STA.dat /etc/Wireless/RT2870STA/RT2870STA.dat && \
# docker build -t wireless .
# docker run --net=host -it wireless
