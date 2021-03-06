#!/bin/sh

bindir="$(dirname ~/bin)/bin/"
curdir="$(pwd)/"

scripts="$(cat link-scripts-links)"


if [ -d "${bindir}" ]; then
    echo "bin exists"
else
    echo "directory ~/bin does not exist"
    exit 1
fi

echo "${scripts}" | while IFS= read -r SINGLELINE
do
    src=$(echo "${SINGLELINE}" | sed 's/ .*//')
    dst=$(echo "${SINGLELINE}" | sed 's/.* //')
    echo "ln -s ${curdir}${src} ${bindir}${dst}"
    ln -s "${curdir}${src}" "${bindir}${dst}"
done




