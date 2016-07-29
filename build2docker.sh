#!/bin/bash
VERSION=$1
ORG=meteor
APP=issue7512
TAG=testcase
CURRENT_DIR=`basename $PWD`
BUILD_DIR=../$CURRENT_DIR-build
DOCKER_TAG="${ORG}/${APP}/${TAG}"
SERVER="http://${APP}.${ORG}.com"
SERVER="http://testcase.dockermachine"

echo "  build:  ${BUILD_DIR}"
echo "  docker: ${DOCKER_TAG}"
echo "  server: ${SERVER}"

# ----- about ------
# builds the meteor app to a bundle dir
# copies DockerfileForBuilt -> bundle dir Dockerfile
# builds the docker image from the bundle
# the image should "just work" after that
# ----- usage ------
# cd <meteor-app-root>
# bash ./build2docker.sh
# ----- source -----
# https://markshust.com/2016/02/01/creating-custom-production-docker-image-meteor-13

set -e
rm -rf $BUILD_DIR


echo "Building to $BUILD_DIR"
meteor build --architecture=os.linux.x86_64 --server=$SERVER --directory $BUILD_DIR

cp DockerfileForBundle $BUILD_DIR/bundle/Dockerfile
touch .dockerignore package.json
cp package.json $BUILD_DIR/bundle/
cp .dockerignore $BUILD_DIR/bundle/
cd $BUILD_DIR/bundle/

echo "Building Dockerfile..."
docker build -t ${DOCKER_TAG}:${VERSION} .
# gcloud docker push ${DOCKER_TAG}:${VERSION}
# kubectl rolling-update ${CURRENT_DIR} --update-period=15s --image=${DOCKER_TAG}:${VERSION}
