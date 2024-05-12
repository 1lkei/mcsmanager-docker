# mcsmanager-docker

### 构建日期2024.5.12

### docker镜像
https://hub.docker.com/r/ilkeiii/mcsmanager-daemon   
https://hub.docker.com/r/ilkeiii/mcsmanager-web

### 添加java
```docker exec -it mcsm-daemon bash```   

```sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && apk update && apk --no-cache add openjdk17```  
 
java路径`/usr/lib/jvm/`   
完成后ctrl+a+d退出