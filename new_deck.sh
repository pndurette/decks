#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <deck_name> (i.e. YYYY_MM_<subject>_<event>)"
    exit 1
fi

# 'YYYY_MM_<subject>_<event>'
DECK_NAME="$1"
mkdir ${DECK_NAME}

# Using RevealJS https://github.com/hakimel/reveal.js
REVEAL_REPO="https://github.com/hakimel/reveal.js.git"
REVEAL_FILES=( css js lib plugin index.html )
REVEAL_VERS="3.7.0"

# Shallow git clone the tag into a tmp dir.
GIT_TEMP="${TMPDIR}/$(date +%s)" && mkdir -p ${GIT_TEMP}
git clone --branch ${REVEAL_VERS} --depth 1 ${REVEAL_REPO} ${GIT_TEMP}

# Copy the minimum set of files
for f in "${REVEAL_FILES[@]}"; do
    cp -r ${GIT_TEMP}/${f} ${DECK_NAME}
done

# Cleanup
rm -rf ${GIT_TEMP}

# Done
echo "Done!"