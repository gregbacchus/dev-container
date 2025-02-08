FROM docker AS docker

# ----------------------------------------------------------------
FROM mcr.microsoft.com/devcontainers/typescript-node:1-22-bookworm AS build

RUN mkdir /workspace && cd /workspace && npm init -y && npm install supabase

# ----------------------------------------------------------------
FROM mcr.microsoft.com/devcontainers/typescript-node:1-22-bookworm

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker
COPY --from=build /workspace/node_modules/supabase/bin/supabase /usr/local/bin/supabase
