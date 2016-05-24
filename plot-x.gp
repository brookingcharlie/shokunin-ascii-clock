#!/usr/bin/env gnuplot

set terminal png
set multiplot
set xrange [0:23]
set yrange [0:16]
plot 'points.in' using 1:3 title columnheader
plot 8 * sin((2.0 * pi / 12.0) * x) + 8 notitle
unset multiplot
