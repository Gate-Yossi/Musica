# shfmt
FROM mvdan/shfmt:latest-alpine as shfmt

# メイン
FROM ubuntu:24.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        git \
        shellcheck \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY --from=shfmt /bin/shfmt /usr/bin/

# ShellSpec
RUN curl -fsSL https://git.io/shellspec | sh -s -- --yes \
 && ln -s /root/.local/lib/shellspec/shellspec /usr/local/bin/
