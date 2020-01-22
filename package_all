#! /usr/bin/env bash
set -eu -o pipefail

all_charts() {
  ls -1 charts/ | awk '{print "charts/"$0}'
}

helm package $(all_charts)
