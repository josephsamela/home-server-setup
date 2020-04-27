
docker run \
    -d \
    --name transmission \
    -p 8080:9091 \
    -p 51413:51413 \
    -v /share/temp:/data \
    gists/transmission
