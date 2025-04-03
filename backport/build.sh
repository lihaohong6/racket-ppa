docker build -t ppa .
docker run --name ppa -dit ppa
gpg -a --export > pub.asc
gpg -a --export-secret-keys > priv.asc
docker cp pub.asc ppa:/root/pub.asc
docker cp priv.asc ppa:/root/priv.asc
rm *.asc
docker exec -it -w /root ppa bash
echo "Remember to clean up the ppa container and image with docker rm and docker rmi"
