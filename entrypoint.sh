#!/bin/bash

# Sets script to fail if any command fails.
set -e

set_xauth() {
	echo xauth add $DISPLAY . $XAUTH
	touch ~/.Xauthority
	xauth add $DISPLAY . $XAUTH
}

print_usage() {
echo "

Usage:	$0 COMMAND

XAPPS Container

Options:
  help		Print this help
  omnet		Run OMNeT++ IDE
"
}

case "$1" in
    help)
        print_usage
        ;;
    omnet)
	set_xauth
	/root/omnetpp-5.3/bin/omnetpp
        ;;
    xeyes)
	set_xauth
	xeyes
        ;;
    *)
        exec "$@"
esac
