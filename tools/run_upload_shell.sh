#!/bin/sh
cd "$(dirname "$0")"
docker inspect record_store >/dev/null 2>&1 || docker create --name record_store btbn/esa_nginx /bin/true
exec docker run -ti --rm --volumes-from record_store --hostname esaupload btbn/esaupload
