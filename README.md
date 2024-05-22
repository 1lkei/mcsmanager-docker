# mcsmanager-docker

### 构建日期2024.5.22
缩减镜像大小

### docker镜像
https://hub.docker.com/r/ilkeiii/mcsmanager-daemon   
https://hub.docker.com/r/ilkeiii/mcsmanager-web
### github地址
https://github.com/ilkeiii/mcsmanager-docker


### web
#### 会自动添加本机daemon，需手动修改地址为docker ip，端口为映射端口即可
```
docker run -d \
    --name mcsm-web \
    -p 63068:23333 \
    --restart unless-stopped \
    -v $(pwd)/mcsmanager/web/data:/opt/mcsmanager/web/data \
    -v $(pwd)/mcsmanager/daemon/data:/opt/mcsmanager/daemon/data \
    ilkeiii/mcsmanager-web:latest
```
### daemon

```
docker run -d \
    --name mcsm-daemon \
    -p 63069:24444 \
    -p 63070:25565 \
    --restart unless-stopped \
    -v $(pwd)/mcsmanager/daemon/data:/opt/mcsmanager/daemon/data \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    ilkeiii/mcsmanager-daemon:latest
```


### 安装java
```docker exec -it mcsm-daemon bash```   
以下二选一:   
中国镜像:   
```sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && apk update && apk --no-cache add openjdk17```   
原版:   
```apk update && apk --no-cache add openjdk17```   

后续安装其他java:```apk --no-cache add openjdk8```   
java路径:```/usr/lib/jvm/```   
完成后ctrl+a+d退出   

卸载java:```apk del openjdk17```