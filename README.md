# mcsmanager-docker

### docker镜像
https://hub.docker.com/r/ilkeiii/mcsmanager-daemon   
https://hub.docker.com/r/ilkeiii/mcsmanager-web
### github地址
https://github.com/ilkeiii/mcsmanager-docker


### web
#### 第一次会自动添加本机daemon，需手动修改ip地址为本机ip，端口为映射端口即可
```
docker run -d \
    --name mcsm-web \
    -p 23333:23333 \
    --restart unless-stopped \
    -v $(pwd)/mcsmanager/web/data:/opt/mcsmanager/web/data \
    -v $(pwd)/mcsmanager/daemon/data:/opt/mcsmanager/daemon/data \
    ilkeiii/mcsmanager-web:latest
```
### daemon

```
docker run -d \
    --name mcsm-daemon \
    -p 24444:24444 \
    -p 25565:25565 \
    --restart unless-stopped \
    -v $(pwd)/mcsmanager/daemon/data:/opt/mcsmanager/daemon/data \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    ilkeiii/mcsmanager-daemon:latest
```


### 安装java 
以下二选一:   
中国镜像:   
```docker exec -it mcsm-daemon sh -i -c 'sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && apk update && apk --no-cache add openjdk17'```   
原版:   
```docker exec -it mcsm-daemon sh -i -c 'apk update && apk --no-cache add openjdk17'```   

卸载java:```docker exec -it mcsm-daemon sh -i -c 'apk del openjdk17'```   
后续安装其他java:```docker exec -it mcsm-daemon sh -i -c 'apk update && apk --no-cache add openjdk8'```   

java路径:```/usr/lib/jvm/```