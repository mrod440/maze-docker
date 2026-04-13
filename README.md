# maze-docker

CLI-only **Waxworks: The Midnight Curse** trivia maze (TCSS 506 Docker assignment).  
Upstream team project: [TCSS504_TriviaMaze_Team4](https://github.com/mrod440/TCSS504_TriviaMaze_Team4) — this repo drops PySide6 / Qt / GUI and keeps `python main.py`.

## Build

The `Dockerfile` clones this **public** repository from GitHub. **Push your commits to GitHub before building**, or the image will not match your local tree.

```bash
docker build -t YOURDOCKERHUB_USERNAME/maze:v1 .
```

Optional (different URL or branch):

```bash
docker build \
  --build-arg MAZE_REPO_URL=https://github.com/mrod440/maze-docker.git \
  --build-arg MAZE_REPO_REF=main \
  -t YOURDOCKERHUB_USERNAME/maze:v1 .
```

## Run

Interactive CLI (requires a TTY and stdin):

```bash
docker run --rm -it YOURDOCKERHUB_USERNAME/maze:v1
```

Run **without** Docker (e.g. on EC2 or your laptop):

```bash
pip install -r requirements.txt
python main.py
```
