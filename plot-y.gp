#!/usr/bin/env gnuplot

set terminal png
set multiplot
set xrange [0:23]
set yrange [0:10]
plot 'points.in' using 1:2 title columnheader
plot -5 * cos((2.0 * pi / 12.0) * x) + 5 notitle
unset multiplot
