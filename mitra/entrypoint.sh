#!/bin/sh
# The extensions directory is a persistent volume, which hides whatever the image ships there, so
# each start copies the bundled plugins in and drops older versions of the same plugin.
set -eu

plugins="${SONARQUBE_HOME:-/opt/sonarqube}/extensions/plugins"
mkdir -p "${plugins}"

for jar in "${SONARQUBE_HOME:-/opt/sonarqube}"/lib/mitra-plugins/*.jar; do
  name="$(basename "${jar}")"
  rm -f "${plugins}/${name%-*}"-*.jar
  cp "${jar}" "${plugins}/${name}"
done

exec "${MITRA_BASE_ENTRYPOINT}" "$@"
