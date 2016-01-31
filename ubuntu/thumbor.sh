#!/bin/bash

PORT=${PORT:-8000}

conf=${1:-/etc/thumbor/thumbor.conf}

/opt/thumbor/bin/thumbor-config > $conf

IFS=$'\n'
for e in $(printenv)
do
    if [[ "$e" == THUMBOR_* ]] ; then
        name=${e%=*}
        name=${name#THUMBOR_}
        value=${e#*=}
        echo "$name = $value" >> $conf
    fi
done

exec /opt/thumbor/bin/thumbor --port $PORT --conf $conf
