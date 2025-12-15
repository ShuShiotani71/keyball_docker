# Commands
```bash
# docker stuffs
cd /path/to/dir_with_dockerfile/
docker build -t <image_name>:<tag> . # tag can be something like "latest" or "1.2.0", etc
docker container run -it --name <container_name> <image_name> bash
docker container stop <container_name>
docker container start <container_name>
docker container run -it --privileged -v /dev:/dev:rw --name <container_name> <image_name> bash
docker exec -it <container_name> bash

# keyball stuffs
make SKIP_GIT=yes <path/to/keyboard>:<keymap>
qmk flash -kb <path/to/keyboard> -km <keymap>

# eg
make SKIP_GIT=yes keyball/keyball39:shiotani
qmk flash -kb keyball/keyball39 -km shiotani
```

# Resources
https://zenn.dev/tmasuyama1114/articles/docker-frequent-commands
https://blog.kefiwild.com/posts/qmk-flash-by-docker/

