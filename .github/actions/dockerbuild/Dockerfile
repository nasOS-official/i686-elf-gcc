FROM archlinux:latest

RUN pacman-key --init

RUN pacman -Syu --noconfirm base-devel namcap git archlinux-keyring

RUN useradd -m builder

RUN su - builder -c "git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
