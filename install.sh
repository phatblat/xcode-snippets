#!/bin/bash
#
# install.sh
#

SNIPPETS_DIR="${HOME}/Library/Developer/Xcode/UserData/CodeSnippets/"

# Ensure the CodeSnippets dir exists
if [ ! -d "${SNIPPETS_DIR}" ]; then
    mkdir -p "${SNIPPETS_DIR}"
fi
