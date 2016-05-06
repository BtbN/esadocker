#!/bin/sh
cd "$(dirname "$0")"
docker inspect record_store >/dev/null 2>&1 || docker create --name record_store btbn/esa_nginx /bin/true
[ -f esa_nginx.env ] || cp systemd/esa_nginx.env esa_nginx.env
exec docker run --rm --env-file ./esa_nginx.env -p 1935:1935 --volumes-from record_store btbn/esa_nginx
