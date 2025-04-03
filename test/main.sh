for version in jammy noble oracular plucky; do
    tag="test-$version"
    docker build --build-arg VERSION="$version" -t "$tag" .
    docker start "$tag" --name "$tag"
    docker exec -i --rm "$tag" bash -c "bash /root/test.sh"
done
