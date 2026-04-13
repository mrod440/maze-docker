# maze-docker

CLI-only **Waxworks: The Midnight Curse** trivia maze (TCSS 506 Docker assignment).  
Upstream team project: [TCSS504_TriviaMaze_Team4](https://github.com/mrod440/TCSS504_TriviaMaze_Team4) — this repo drops PySide6 / Qt / GUI and keeps `python main.py`.

## Run locally

```bash
python -m venv .venv && source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
python main.py
```

## Tests

```bash
pip install pytest
python -m pytest tests/ -v
```

## Docker (matches EC2 / assignment)

The `Dockerfile` **clones this repository** from GitHub. **Push your latest commit before `docker build`**, or the image will not include your local changes.

Build (pick your Hub username / tag for the assignment):

```bash
docker build -t YOURDOCKERHUB/maze:v1 .
```

Run (interactive CLI; **`-it`** is required):

```bash
docker run --rm -it YOURDOCKERHUB/maze:v1
```

Override clone URL or branch when building:

```bash
docker build \
  --build-arg MAZE_REPO_URL=https://github.com/mrod440/maze-docker.git \
  --build-arg MAZE_REPO_REF=main \
  -t YOURDOCKERHUB/maze:v1 .
```

## Docker Hub

After `docker login`:

```bash
docker push YOURDOCKERHUB/maze:v1
```

Portability check: `docker rmi YOURDOCKERHUB/maze:v1`, then `docker pull` and `docker run --rm -it ...` again.

## ARM64 (Graviton / t4g)

Official `python:3.12-slim-bookworm` is multi-arch; the same Dockerfile works on **t4g.small** when you build on the instance (or use `docker buildx` with `--platform linux/arm64` from another machine).
