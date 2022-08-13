#!/bin/sh

set -o nounset
set -o errexit
set -o xtrace

hash ghead 2>/dev/null && head="ghead" || head="head"

${head} -n -1 catalog-template.setup > eclipse-projects.setup

find projects -name "*.setup" -print0 \
    | sort --zero-terminated \
    | xargs -0 -I % \
    	echo '  <project href="https://arlol.github.io/eclipse-projects/'"%"'#/"/>' \
    		>> eclipse-projects.setup \;

echo "<!-- $(date) -->" >> eclipse-projects.setup
echo '</setup:ProjectCatalog>' >> eclipse-projects.setup
