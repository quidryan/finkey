# in `finkey/Dockerfile`
# syntax = docker/dockerfile:1.4

FROM rust:1.84 AS builder

WORKDIR /app
COPY . .

RUN \
        --mount=type=cache,target=/usr/local/cargo/registry \
		--mount=type=cache,target=/usr/local/cargo/git \
        --mount=type=cache,target=/app/target \
		set -eux; \
	 	cargo build --release; \
		objcopy --compress-debug-sections target/release/finkey ./finkey

################################################################################
FROM debian:12.9-slim

RUN set -eux; \
        export DEBIAN_FRONTEND=noninteractive; \
	    apt update; \
        apt install --yes --no-install-recommends bind9-dnsutils iputils-ping iproute2 curl ca-certificates htop; \
		apt clean autoclean; \
		apt autoremove --yes; \
		rm -rf /var/lib/{apt,dpkg,cache,log}/; \
		echo "Installed base utils!"

WORKDIR /app

COPY --from=builder /app/finkey ./finkey
CMD ["./finkey"]