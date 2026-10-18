#!/usr/bin/env sh
# Lightweight Gradle 8.6 bootstrap for environments where the binary wrapper JAR is unavailable.
# The official Gradle distribution is downloaded and cached in GRADLE_USER_HOME.
set -eu
VERSION=8.6
BASE="${GRADLE_USER_HOME:-$HOME/.gradle}/bootstrap/gradle-$VERSION"
BIN="$BASE/gradle-$VERSION/bin/gradle"
if [ ! -x "$BIN" ]; then
  mkdir -p "$(dirname "$BASE")"
  ZIP="${TMPDIR:-/tmp}/gradle-$VERSION-bin.zip"
  URL="https://services.gradle.org/distributions/gradle-$VERSION-bin.zip"
  if command -v curl >/dev/null 2>&1; then curl -fL "$URL" -o "$ZIP"
  elif command -v wget >/dev/null 2>&1; then wget -O "$ZIP" "$URL"
  else echo 'ERROR: curl or wget is required to download Gradle 8.6.' >&2; exit 1; fi
  command -v unzip >/dev/null 2>&1 || { echo 'ERROR: unzip is required.' >&2; exit 1; }
  mkdir -p "$BASE"
  unzip -q -o "$ZIP" -d "$BASE"
fi
exec "$BIN" "$@"
