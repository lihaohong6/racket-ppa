gpg -a --export > pub.asc
gpg -a --export-secret-keys > priv.asc
docker build -t ppa
rm *.asc
docker run ppa --name ppa
docker exec -it ppa bash
