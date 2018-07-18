# http-debug

Simple but very helpfull necessary service provides common information about HTTP request that very usefull for debug network


```json
{
  "headers": {
    "Accept": ["text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8"],
    "Accept-Encoding": ["gzip, deflate, br"],
    "Accept-Language": ["ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7"],
    "Connection": ["keep-alive"],
    "Cookie": ["PHPSESSID=165f4daddcb6a61feefdf52fb6d81809; _spuid=412362076355730023; uid=6385511270665158656"],
    "Dnt": ["1"],
    "Upgrade-Insecure-Requests": ["1"],
    "User-Agent": ["Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36"]
  },
  "host": "127.0.0.1:7788",
  "path": "/",
  "remote": "172.17.0.1:33712"
}
```


## Running on host machine

build

```
go get github.com/madiedinro/http_debug
```

then start

```
http_debug -listen=:19992
```

## Using docker Building docker image

run at host network
```
docker run --rm -d --name httpdebug --network=host madiedinro/http_debug --listen=172.16.25.1:19992
```

to build image or no to build image

```
docker build -t madiedinro/http_debug .
docker push madiedinro/http_debug
```