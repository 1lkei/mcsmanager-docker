# mcsmanager-docker

### 构建日期2024.5.12

### docker镜像
https://hub.docker.com/r/ilkeiii/mcsmanager-daemon   
https://hub.docker.com/r/ilkeiii/mcsmanager-web

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