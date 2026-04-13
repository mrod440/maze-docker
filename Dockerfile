# CLI-only Waxworks maze.
# Docker build clones from GitHub, so the repo must be public
# (or you must configure authenticated cloning for private access).

FROM python:3.12-slim-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ARG MAZE_REPO_URL=https://github.com/mrod440/maze-docker.git
ARG MAZE_REPO_REF=main

RUN git clone --depth 1 --branch "${MAZE_REPO_REF}" "${MAZE_REPO_URL}" .

RUN pip install --no-cache-dir -r requirements.txt

ENV PYTHONUNBUFFERED=1

CMD ["python", "main.py"]
