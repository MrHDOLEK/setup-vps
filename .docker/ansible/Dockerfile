FROM debian:buster as base

ARG ANSIBLE_CORE_VERSION_ARG="2.10.17"
ARG ANSIBLE_LINT="5.4.0"
ENV ANSIBLE_LINT ${ANSIBLE_LINT}
ENV ANSIBLE_CORE ${ANSIBLE_CORE_VERSION_ARG}


RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y python3-pip whois python sshpass git openssh-client libhdf5-dev libssl-dev libffi-dev  && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN pip3 install --upgrade pip cffi && \
    pip install ansible-base==${ANSIBLE_CORE} && \
    pip install mitogen ansible-lint==${ANSIBLE_LINT} jmespath && \
    pip install --root-user-action=ignore passlib && \
    pip install --upgrade pywinrm && \
    rm -rf /root/.cache/pip

COPY . /etc/ansible
WORKDIR /etc/ansible
RUN ansible-galaxy install -r requirements.yml

FROM base as ssh

RUN apt update && apt install  openssh-server sudo -y

RUN useradd -m test && echo "test:test" | chpasswd && adduser test sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
