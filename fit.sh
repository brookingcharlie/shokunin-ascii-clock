#!/bin/bash

./fit-x.gp > fit-x.png
./fit-y.gp > fit-y.png
open fit-{x,y}.png
