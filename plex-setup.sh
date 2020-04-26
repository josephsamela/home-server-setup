# On the host, organize your media library like this:
#
# /share/Library/
#   |── Movies
#   ├── Music
#   └── TV
#
# Next visit `https://www.plex.tv/claim`. Copy the claim code into the variable `-e PLEX_CLAIM=""`.

# Download container image...
docker pull plexinc/pms-docker

# ...then start the container!
docker run -d \
--name=plex \
--restart=always \
--network=host \
-e TZ="America/Boston" \
-e PLEX_CLAIM="<-put-claim-code-here->" \
-v /share/Library:/data \
plexinc/pms-docker

# Run this command then access the web interface at `http://host:32400`. 
# Follow setup to create libraries with media in the `/data` folder.
