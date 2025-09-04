# Kasm OpenArena
OpenArena docker image for Kasm Workspaces (https://kasmweb.com)

Load this image into Kasm Workspaces by adding the Sully's Choice Kasm Workspace Registry: https://sullyschoice.github.io/kasm-registry/

## Manual Run

```bash
sudo docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_PW=password ghcr.io/sullyschoice/kasm-openarena:latest
```

Access via your browser: `https://<your ip>:6901` username: `kasm` , password: `password`

## Build
```bash
sudo docker build -t openarena:latest -f Dockerfile .
```