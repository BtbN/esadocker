#!/bin/sh
if [ $# != 1 ]; then
	echo "Missing argument"
	exit 1
fi

if docker inspect record_store >/dev/null 2>&1; then
	echo "record_store container already exists"
	exit 1
fi

mkdir -p "${1}"
docker create -v "${1}:/record" --name record_store btbn/esa_nginx /bin/true

