FROM archlinux:latest

RUN pacman-key --init

RUN pacman -Syu --noconfirm base-devel namcap git archlinux-keyring

RUN useradd -m builder

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
