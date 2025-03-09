#!/bin/sh

set -o nounset
set -o errexit
set -o xtrace

hash ghead 2>/dev/null && head="ghead" || head="head"
hash gxargs 2>/dev/null && xargs="gxargs" || xargs="xargs"

mkdir -p _site

{
    ${head} -n -1 catalog-template.setup

    find projects -name "*.setup" -print0 \
        | sort --zero-terminated \
        | ${xargs} --null -I % \
        echo '<project href="https://arlol.github.io/eclipse-projects/%#/"/>'

    echo "<!-- $(date) -->"

    echo '</setup:ProjectCatalog>'

} > _site/eclipse-projects.setup

cp index.html _site/
cp -R projects _site/
