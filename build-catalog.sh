#!/bin/sh

set -o nounset
set -o errexit
set -o xtrace

hash ghead 2>/dev/null && head="ghead" || head="head"

${head} -n -1 catalog-template.setup > arlos-projects.setup

find projects -name "*.setup" \
	-exec echo '  <project href="https://arlol.github.io/oomph-setups/'"{}"'#/"/>' \
    	>> arlos-projects.setup \;

echo '</setup:ProjectCatalog>' >> arlos-projects.setup
