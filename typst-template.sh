#!/usr/bin/env zsh
# typst-template.sh
# Lists available Typst templates (*.typ) from a GitHub repo,
# allows you to interactively select one and download it to the current directory—
# without needing to clone the whole repository.
#
# Usage:
#   chmod +x typst-template.sh
#   ./typst-template.sh
#
# Optional environment variables (all default to your repo/branch unless set):
#   OWNER         GitHub username      (default: ChennoShen239)
#   REPO          Repo name           (default: typst_templates)
#   BRANCH        Branch name         (default: main)
#   GITHUB_TOKEN  GitHub Token to raise API rate limit (optional)
#   CURL_OPTS     Extra args for curl (e.g. "-4" for IPv4, optional)

set -euo pipefail

OWNER="${OWNER:-ChennoShen239}"
REPO="${REPO:-typst_templates}"
BRANCH="${BRANCH:-main}"
API_URL="https://api.github.com/repos/${OWNER}/${REPO}/contents"
RAW_BASE="https://raw.githubusercontent.com/${OWNER}/${REPO}/${BRANCH}"
CURL_OPTS="${CURL_OPTS:-}"

require_dep() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Missing dependency: $1 (e.g. brew install $1)" >&2
    exit 1
  fi
}

fetch_templates() {
  local auth_header=()
  [[ -n "${GITHUB_TOKEN:-}" ]] && auth_header=(-H "Authorization: Bearer ${GITHUB_TOKEN}")

  # Print available templates (*.typ), one per line
  if ! curl ${=CURL_OPTS} -fsSL "${auth_header[@]}" "$API_URL" \
    | jq -r '.[] | select(.name | endswith(".typ")) | .name'; then
    echo "Failed to fetch template list from GitHub API: ${API_URL}" >&2
    exit 1
  fi
}

choose_template() {
  local templates=("$@")

  if (( ${#templates[@]} == 0 )); then
    echo "No .typ templates found in ${OWNER}/${REPO} (branch ${BRANCH})." >&2
    exit 1
  fi

  print "Select a Typst template to download (0 to cancel):"
  local PS3="Enter choice: "

  select template in "${templates[@]}"; do
    [[ $REPLY == 0 ]] && { echo "Cancelled."; exit 0; }
    if [[ -n "${template:-}" ]]; then
      echo "$template"
      return 0
    else
      print "Invalid choice, try again."
    fi
  done
}

download_template() {
  local template="$1"
  local url="${RAW_BASE}/${template}"

  echo "Downloading ${template} to $(pwd)..."

  # Use sensible timeouts for download; tweak as needed for slow connections.
  if ! curl ${=CURL_OPTS} -fL --progress-bar \
      --connect-timeout 5 --max-time 120 \
      "$url" -o "$template"; then
    echo
    echo "Download failed. Please check your network to GitHub / raw.githubusercontent.com." >&2
    exit 1
  fi

  echo
  echo "Done."
}

main() {
  require_dep curl
  require_dep jq

  # Use zsh's array splitting to load multi-line output into array
  local templates
  templates=("${(@f)$(fetch_templates)}")

  local choice
  choice="$(choose_template "${templates[@]}")"
  download_template "$choice"
}

main "$@"