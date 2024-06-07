SPOTIFY_NAME_URL=http://repository.spotify.com/pool/non-free/s/spotify-client/

name=$(curl http://repository.spotify.com/pool/non-free/s/spotify-client/ | grep 'spotify-client_[^-]\+_amd64\.deb' | sed 's|.*>\(.*\)<.*|\1|')

wget $SPOTIFY_NAME_URL$name -O spotify-latest.deb
