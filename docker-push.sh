#!/bin/bash

docker_user="$1"
docker_psw="$2"
echo "$docker_psw" | docker login --username "$docker_user" --password-stdin

imageTag="$3"
if [ -z "$imageTag" ]; then
  version=(`cat gradle.properties | grep "casVersion" | cut -d= -f2`)
  echo "CAS version: ${version}"
  if [[ $version == *"-SNAPSHOT"* ]]; then
      imageTag="latest"
  else
      imageTag="v${version}" 
  fi
fi

echo "Pushing CAS docker image tagged as [$imageTag] to [apereo/cas-bootadmin-server]..."
docker push apereo/cas-bootadmin-server:"$imageTag" && echo "Pushed apereo/cas-bootadmin-server:$imageTag successfully.";