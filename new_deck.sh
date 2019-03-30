#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <deck_name> (i.e. YYYY_MM_<subject>_<event>)"
    exit 1
fi

#---------------
echo ">>> Initializing new deck... ($1)"

# 'YYYY_MM_<subject>_<event>'
DECK_NAME="$1"
mkdir ${DECK_NAME}

# Using RevealJS https://github.com/hakimel/reveal.js
REVEAL_REPO="https://github.com/hakimel/reveal.js.git"
REVEAL_FILES=( css js lib plugin index.html )
REVEAL_VERS="3.7.0"

# Save version of RevealJS for doc. reference
echo ${REVEAL_VERS} > ${DECK_NAME}/version.txt

#---------------
echo ">>> Cloning fresh version of reveal.js (v.$REVEAL_VERS)..."

# Shallow git clone the tag into a tmp dir.
GIT_TEMP="${TMPDIR}/$(date +%s)" && mkdir -p ${GIT_TEMP}
git clone --branch ${REVEAL_VERS} --depth 1 ${REVEAL_REPO} ${GIT_TEMP}

# Copy the minimum set of files
for f in "${REVEAL_FILES[@]}"; do
    cp -r ${GIT_TEMP}/${f} ${DECK_NAME}
done

# Cleanup
rm -rf ${GIT_TEMP}

#---------------
echo ">>> Adding base content and docs..."

CONTENT_DIR="${DECK_NAME}/content" && mkdir -p ${CONTENT_DIR}

# Example Markdown file
echo "
# Slide 1a

first slide A


# Slide 1b

first slide B



# Slide 2

second slide
" > ${CONTENT_DIR}/index.md

# Example Readme
echo "# ${DECK_NAME}" > ${DECK_NAME}/README.md

# Done
echo ">>> Done!"
echo ">>> Be sure to modify the following in ${DECK_NAME}/index.html:

1. Change the <title>.

2. Change the theme (<link rel='stylesheet' href='css/theme/black.css'>)

3. Load the external markdown.
   Change the whole <div class='reveal'> to:

<div class='reveal'>
    <div class='slides'>
        <section data-markdown='content/index.md'
                 data-separator='^\n\n\n'
                 data-separator-vertical='^\n\n'
                 data-separator-notes='^Note:'
                 data-charset='utf-8'>
        </section>
    </div>
</div>

4. Change configuration (Reveal.initialize)
"