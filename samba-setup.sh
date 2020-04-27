
docker run \
    -d \
    --name samba-server \
    -p 137:137/udp \
    -p 138:138/udp \
    -p 139:139/tcp \
    -p 445:445/tcp \
    -v /share:/mnt \
    gists/samba-server
