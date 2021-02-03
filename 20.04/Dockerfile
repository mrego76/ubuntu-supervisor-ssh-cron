FROM ubuntu:20.04
LABEL maintainer="mrego@anakonn.com" \
	name="ubuntu-supervisor-ssh-cron" \
	version="0.1"

# 패키지 설치시 대화 상자 표시되지 않도록
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /

ENV ROOTPWD=rootpwd
# set -x 는 디버깅 시작점
RUN set -x && \
apt update -y && apt install -y \
cron supervisor openssh-server nano git && \
rm -rf /var/lib/apt/lists/* && \
mkdir /var/run/sshd && \
sed 's/#PermitRootLogin.*/PermitRootLogin yes/g' -i /etc/ssh/sshd_config && \
echo "[program:sshd]\n\
command=/usr/sbin/sshd -D\n\
[program:cron]\n\
command=cron -f" >> /etc/supervisor/conf.d/supervisord.conf

COPY ./cmd.sh .

EXPOSE 22
CMD ["/bin/bash", "cmd.sh"]