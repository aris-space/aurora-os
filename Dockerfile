FROM ubuntu

# The following 2 lines are added to avoid hanging the container creation. See <https://grigorkh.medium.com/fix-tzdata-hangs-docker-image-build-cdb52cc3360d>
ENV TZ=Europe/Brussels
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y gawk wget git-core diffstat unzip texinfo repo \
                                             gcc-multilib build-essential chrpath socat cpio \
                                             python3 python3-pip python3-pexpect \
                                             xz-utils debianutils iputils-ping python3-git \
                                             python3-jinja2 libegl1-mesa libsdl1.2-dev xterm \
                                             locales python3-distutils libssl-dev gdisk sudo \
                                             libgmp-dev libmpc-dev pylint file zstd lz4 vim bsdmainutils

RUN groupadd -g 1000 dev \
			&& useradd -u 1000 -g dev -d /home/dev dev \
			&& mkdir /home/dev \
			&& chown -R dev:dev /home/dev
	
# The following 3 lines allow the 'dev' user to run sudo (password is "dev"). 
# Useful when later on packages need to be installed that are missing.
RUN usermod -aG sudo dev
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'dev:dev' | chpasswd
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

USER dev

RUN git config --global user.email "janko.uehlinger@infosys.ch"
RUN git config --global user.name "Janko Uehlinger"

WORKDIR /home/dev
COPY ./scripts scripts
RUN ./scripts/fetch_distribution_package.sh && mkdir src/layers/meta-aurora
COPY ./meta-aurora src/layers/meta-aurora
RUN ./scripts/setup_env.sh

CMD ./scripts/bitbake.sh
