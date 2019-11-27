#!/bin/bash

# Exit with nonzero exit code if anything fails
set -e 

HANDOUTS="kapow-moves-handout kapow-playbook-handouts kapow-team-handout kapow-narrator-handout"

# Run pdflatex twice on the main rules in order to ensure
# crossreferences are up to date.
pdflatex kapow-rules
pdflatex kapow-rules

# The other files don't have crossreferences and so we should
# only have to run pdflatex once.
for source in ${HANDOUTS}; do
    pdflatex "$source"
done

# Make the distribution directory
mkdir -p dist

# Copy all the required files into it
cp kapow*pdf logo.png index.html dist
