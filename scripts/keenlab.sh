#!/bin/sh
# Fetch and verify Keenlab documents, or check for new and changed ones.
set -eu

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
readonly ROOT_DIR
readonly MANIFEST="${KEENLAB_MANIFEST:-$ROOT_DIR/keenlab.manifest}"
readonly VENDOR_DIR="$ROOT_DIR/vendor"
readonly PRODUCT_PAGES="https://www.keenlab.de/index.php/portfolio-item/kweld/
https://www.keenlab.de/index.php/product/ksupply/
https://www.keenlab.de/index.php/product/kweld-ultracapacitor-module/
https://www.keenlab.de/index.php/product/kweld-firmware-update-tool/"
readonly LINK_PATTERN='https://www\.keenlab\.de/wp-content/uploads/[^"'"'"' <>)\\]*\.(pdf|zip|stl|dxf)'

WORK_DIR=""
PROBLEMS=0

_cleanup() {
  if [ -n "$WORK_DIR" ]; then
    rm -rf "$WORK_DIR"
  fi
}

_usage() {
  echo "usage: keenlab.sh fetch|check" >&2
  exit 2
}

_sha256() {
  if command -v shasum >/dev/null 2>&1; then
    shasum -a 256 "$1" | cut -d ' ' -f 1
  else
    sha256sum "$1" | cut -d ' ' -f 1
  fi
}

_report() {
  echo "$1 $2"
  PROBLEMS=$((PROBLEMS + 1))
}

_in_manifest() {
  awk -v u="$1" '$2 == u { found = 1 } END { exit !found }' "$MANIFEST"
}

_fetch_one() {
  _fetch_one_sum="$1"
  _fetch_one_url="$2"
  _fetch_one_dest="$VENDOR_DIR/$(basename "$_fetch_one_url")"
  if [ -f "$_fetch_one_dest" ] && [ "$(_sha256 "$_fetch_one_dest")" = "$_fetch_one_sum" ]; then
    echo "present $_fetch_one_dest"
    return 0
  fi
  curl -fsSL -o "$_fetch_one_dest" "$_fetch_one_url"
  if [ "$(_sha256 "$_fetch_one_dest")" != "$_fetch_one_sum" ]; then
    echo "checksum mismatch: $_fetch_one_dest" >&2
    return 1
  fi
  echo "fetched $_fetch_one_dest"
}

cmd_fetch() {
  mkdir -p "$VENDOR_DIR"
  while read -r _cmd_fetch_sum _cmd_fetch_url; do
    _fetch_one "$_cmd_fetch_sum" "$_cmd_fetch_url"
  done <"$MANIFEST"
}

_check_checksums() {
  while read -r _check_checksums_sum _check_checksums_url; do
    _check_checksums_file="$WORK_DIR/$(basename "$_check_checksums_url")"
    if ! curl -fsSL -o "$_check_checksums_file" "$_check_checksums_url"; then
      _report MISSING "$_check_checksums_url"
    elif [ "$(_sha256 "$_check_checksums_file")" != "$_check_checksums_sum" ]; then
      _report CHANGED "$_check_checksums_url"
    fi
  done <"$MANIFEST"
}

_check_page() {
  _check_page_file="$WORK_DIR/page.html"
  if ! curl -fsSL -o "$_check_page_file" "$1"; then
    _report UNREACHABLE "$1"
    return 0
  fi
  _check_page_links="$(grep -Eo "$LINK_PATTERN" "$_check_page_file" | sort -u || true)"
  for _check_page_link in $_check_page_links; do
    if ! _in_manifest "$_check_page_link"; then
      _report NEW "$_check_page_link"
    fi
  done
}

_check_pages() {
  for _check_pages_url in $PRODUCT_PAGES; do
    _check_page "$_check_pages_url"
  done
}

cmd_check() {
  WORK_DIR="$(mktemp -d "${TMPDIR:-/tmp}/keenlab.XXXXXX")"
  _check_checksums
  _check_pages
  if [ "$PROBLEMS" -gt 0 ]; then
    exit 1
  fi
  echo ok
}

main() {
  trap _cleanup EXIT
  if [ "$#" -lt 1 ]; then
    _usage
  fi
  case "$1" in
    fetch) cmd_fetch ;;
    check) cmd_check ;;
    *) _usage ;;
  esac
}

main "$@"
