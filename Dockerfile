# DESCRIPTION:    Image with weechat
# TO_BUILD:       docker build -t amcorreia/docker-weechat .
# TO_RUN:         docker run -it --rm --name weechat amcorreia/docker-weechat

# Base docker image
FROM alpine:latest
MAINTAINER  Alessandro Madruga Correia <mutley.sandro@gmail.com>

ENV LANG="C.UTF-8" HOME="/home/user"

RUN adduser -u 1000 -D user \
      && mkdir -p $HOME/.weechat \
      && chown -R user:user $HOME \
      && set -x && apk add --no-cache --virtual weechat

WORKDIR $HOME
VOLUME $HOME

USER user
CMD ["weechat"]
