#!/bin/bash -e
#
# install.sh
#

REPO_URL="https://github.com/phatblat/xcode-snippets.git"
SNIPPETS_DIR="${HOME}/Library/Developer/Xcode/UserData/CodeSnippets/"
TMP_DIR="/tmp/codesnippets"

# Ensure the CodeSnippets dir exists
if [ ! -d "${SNIPPETS_DIR}" ]; then
    mkdir -p "${SNIPPETS_DIR}"
fi

# if dir is not empty, move current snippets out of the way before clone
if [ "$(ls -A ${SNIPPETS_DIR})" ]; then
    if [ ! -d "${TMP_DIR}" ]; then
        mkdir "${TMP_DIR}"
    fi
    mv "${SNIPPETS_DIR}" "${TMP_DIR}"
    RESTORE_SNIPPETS=1
fi

# clone
git clone "${REPO_URL}" "${SNIPPETS_DIR}"

# Check to see if pre-existing snippets need to be restored
if [ -z ${RESTORE_SNIPPETS} ]; then
    echo "Restoring snippets"
    mv "${TMP_DIR}/CodeSnippets/*" "${SNIPPETS_DIR}"
    rm -rf "${TMP_DIR}"
    open -a Terminal "${SNIPPETS_DIR}"
fi
