#!/usr/bin/env sh

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
	tmux source-file "$CURRENT_DIR/ayu-dusk.conf"
}

main
