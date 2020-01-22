#! /usr/bin/env bash
set -eu -o pipefail

repo_url=${repo_url:-"https://alantp6.github.io/charts/"}

helm repo index . --url "${repo_url}"
