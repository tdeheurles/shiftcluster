FROM        ubuntu

ARG         containers_maintainer

MAINTAINER  $containers_maintainer

RUN         apt-get update
RUN         apt-get install -y curl tar python
RUN         curl https://sdk.cloud.google.com | bash
RUN         /root/google-cloud-sdk/bin/gcloud components update kubectl
RUN         /root/google-cloud-sdk/bin/gcloud components install alpha -q
RUN         /root/google-cloud-sdk/bin/gcloud components install beta -q

ENV         PATH    /root/google-cloud-sdk/bin:$PATH
CMD         /bin/sh
