#! /usr/bin/bash

DOCKER="docker"

for version in jammy noble oracular plucky; do
    tag="test-$version"
    $DOCKER build --build-arg VERSION="$version" -t "$tag" .
    echo "Image $tag built"
    # In case a container is already running (possibly from a previous
    # failed test), stop and remove it.
    $DOCKER rm -f "$tag"
    $DOCKER run --name "$tag" -dit "$tag"
    echo "Container $tag started"
    if $DOCKER exec "$tag" bash -c "bash /root/test.sh"; then
        echo "Test for $version passed"
        echo "Removing container and image"
        $DOCKER stop "$tag"
        $DOCKER rm "$tag"
        $DOCKER rmi "$tag"
    else
        echo "Test failed. Inspect container $tag for details."
        exit 1
    fi
done
