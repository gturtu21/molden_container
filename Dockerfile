FROM	ubuntu:18.04 AS build
WORKDIR	/app
COPY	entrypoint.sh /app
RUN	apt-get update -y && apt-get upgrade -y \
	&& apt-get install gfortran -y \
	&& apt-get install libx11-6 -y \
	&& apt-get install libx11-dev  -y \
	&& apt-get install libgl1-mesa-glx -y \
	&& apt-get install libgl1-mesa-dev -y \
	&& apt-get install build-essential -y \
	&& apt-get install mesa-common-dev -y \ 
	&& apt-get install libglu1-mesa-dev -y \
	&& apt-get install libxmu-dev -y \
	&& apt-get install xutils-dev -y \
	&& apt-get install wget -y \
	&& cd /usr/local \
	&& wget https://ftp.science.ru.nl/Molden/bin/Linux/molden6.9.full.ubuntu.18.04.tar.gz \
	&& tar -xf molden6.9.full.ubuntu.18.04.tar.gz 	\
	&& chmod +x /app/entrypoint.sh
#FROM 	ubuntu:18.04 AS final
#WORKDIR	/app
#COPY	--from=build /usr/local/molden /usr/local/molden

ENV MOLDENHOME="/usr/local/molden/bin"
ENV PATH=$PATH:$MOLDENHOME	

#ENTRYPOINT ["molden", "param1"]
ENTRYPOINT ["/app/entrypoint.sh"]
