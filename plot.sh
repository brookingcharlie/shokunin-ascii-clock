#!/bin/bash

./plot-x.gp > plot-x.png
./plot-y.gp > plot-y.png
open plot-{x,y}.png
