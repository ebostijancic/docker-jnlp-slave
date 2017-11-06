FROM jenkinsci/jnlp-slave:3.10-1

ARG docker_version=1.12.1

USER root

RUN apt-get update -qq && apt-get install -qqy \
      apt-transport-https \
      ca-certificates \
      curl \
 && rm -rf /var/lib/apt/lists/* \
 && update-ca-certificates -f \
 && curl -vOL "https://get.docker.com/builds/Linux/x86_64/docker-${docker_version}.tgz" \
 && tar zxvf "docker-${docker_version}.tgz" \
 && chmod +x docker/docker \
 && mv docker/docker /usr/bin/ \
 && rm -rf docker*
