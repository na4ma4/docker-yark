# docker-yark

Yark docker container

## Basic Usage

```shell
mkdir data
docker run -d --rm -v "$(pwd)/data:/yark" -p 7667:7667 --name yark ghcr.io/na4ma4/yark:1
```

The web interface will be available at [http://localhost:7667/](http://localhost:7667/).

## Managing your Archive

Adding a channel

```shell
docker exec yark yark new owez https://www.youtube.com/channel/UCSMdm6bUYIBN0KfS2CVuEPA
```

Refreshing a channel

```shell
docker exec yark yark refresh owez
```
