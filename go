#!/usr/bin/env bash

case "$1" in
  run) runghc main.hs ;;
  test) runghc Shokunin_tests.hs ;;
  *) echo "Usage: ./go run|test" ;;
esac
