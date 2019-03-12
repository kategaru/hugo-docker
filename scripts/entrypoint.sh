#!/bin/bash
set -e

if [ ! -e quickstart ]; then
  echo "clone quickstart repository"
  hugo new site quickstart
  git init
  git submodule add https://github.com/budparr/gohugo-theme-ananke.git quickstart/themes/ananke
  cd quickstart && echo 'theme = "ananke"' >> config.toml

  hugo new posts/my-first-post.md
fi

exec "$@"
