FROM nixos/nix:latest AS builder

ARG TARGETPLATFORM

COPY . /tmp/build
WORKDIR /tmp/build

RUN \
case "$TARGETPLATFORM" in \
    linux/amd64) \
        package=amd64 \
        ;; \
    linux/arm64) \
        package=arm64 \
        ;; \
    linux/arm/v*) \
        package=arm \
        ;; \
    linux/386) \
        package=i386 \
        ;; \
    esac \
&& nix-build \
--attr "releasePackages.${package}" \
--option filter-syscalls false \
--option max-jobs auto \
--option cores 0 \
--option log-lines 200 \
--option filter-syscalls false \
--option keep-outputs true \
--option keep-derivations true

FROM debian:12.11-slim AS runner

ENV RUST_BACKTRACE=1
ENV RUST_LOG=garage=info

RUN mkdir -p /opt/garage

COPY --from=builder /tmp/build/result/bin/garage /opt/garage

CMD [ "/garage", "server"]
