# maze-docker

CLI-only **Waxworks: The Midnight Curse** trivia maze.

This image runs the terminal game with `python main.py` (no GUI dependencies).

## Prerequisites

- Docker installed and running
- Internet access during `docker build` (the Dockerfile clones this repository)
- Repository is public (or authenticated clone is configured)

## Build the image

Basic build:

```bash
docker build -t YOURDOCKERHUB_USERNAME/maze:v1 .
```

Build from a specific repo URL or branch:

```bash
docker build \
  --build-arg MAZE_REPO_URL=https://github.com/mrod440/maze-docker.git \
  --build-arg MAZE_REPO_REF=main \
  -t YOURDOCKERHUB_USERNAME/maze:v1 .
```

## Run the maze (interactive CLI)

```bash
docker run --rm -it YOURDOCKERHUB_USERNAME/maze:v1
```

`-it` is required so you can enter commands in the game prompt.

## Pull and run the published image

```bash
docker pull mrgdz42/maze:v1
docker run --rm -it mrgdz42/maze:v1
```

## Push your own image tag

```bash
docker login
docker push YOURDOCKERHUB_USERNAME/maze:v1
```

## Run without Docker

```bash
pip install -r requirements.txt
python main.py
```

## Troubleshooting

- **`fatal: could not read Username for 'https://github.com'` during build**
  - The repo is private and `git clone` in Docker cannot prompt for credentials.
  - Make the repo public, or switch Docker build to SSH/token-based authentication.
