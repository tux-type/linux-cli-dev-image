FROM archlinux:latest

# Update package repository
RUN pacman -Syu --noconfirm

# Install dev tools
RUN pacman -S --noconfirm \
  git \
  base-devel \
  fish \
  neovim \
  keychain \
  tmux \
  eza \
  fd \
  bat \
  ripgrep \
  stow \
  rust \
  go \
  starship \
  fzf \
  wl-clipboard \
  go-yq \
  jq \
  difftastic \
  vivid \
  man-db \
  unzip \
  glibc \
  python \
  uv \
  lua51 \
  luarocks


# Change default shell to fish
RUN chsh -s /usr/bin/fish

# Change default ls colours
RUN set -Ux LS_COLORS $(vivid generate catppuccin-mocha)

# Install fnm
RUN curl -fsSL https://fnm.vercel.app/install | SHELL=/usr/bin/fish bash

# Use the host install of podman
RUN ln -s /usr/bin/distrobox-host-exec /usr/local/bin/podman

