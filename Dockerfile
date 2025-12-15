FROM ghcr.io/qmk/qmk_cli@sha256:2dc05fc9f32efebd6b05c2b8676ee548358bc7e151e9dbf4dac6b6eed4513b07

# git config
ARG GIT_USERNAME="ShuShiotani71"
ARG GIT_EMAIL="shu.shiotani70@gmail.com"
ARG KEYBALL_REPO="https://github.com/ShuShiotani71/keyball.git"
# keyball config
ARG KEYBALL_PATH="keyball/keyball39"
ARG KEYMAP="shiotani"

WORKDIR /root/

RUN apt update && apt install -y \
    vim \
    usbutils \
    openssh-client \
    tmux

RUN git config --global user.name ${GIT_USERNAME}
RUN git config --global user.email ${GIT_EMAIL}
RUN ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa

COPY my_config/* /root/

RUN git clone ${KEYBALL_REPO} keyball
RUN git clone https://github.com/qmk/qmk_firmware.git --depth 1 --recurse-submodules --shallow-submodules -b 0.22.14 qmk
RUN ln -s /root/keyball/qmk_firmware/keyboards/keyball /root/qmk/keyboards/keyball

WORKDIR /root/qmk
RUN make SKIP_GIT=yes ${KEYBALL_PATH}:${KEYMAP}
