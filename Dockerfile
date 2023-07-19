FROM alpine:edge

LABEL maintainer="Gary Kenneally"

RUN apk add git lazygit neovim ripgrep gzip alpine-sdk --update

RUN git clone https://github.com/LazyVim/starter ~/.config/nvim

RUN nvim +MasonUpdate +qall

WORKDIR /home
VOLUME /home

ENTRYPOINT [ "nvim" ]
CMD [""]