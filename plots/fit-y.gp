#!/usr/bin/env gnuplot

set terminal png

f(x) = a * cos(b * x) + d
b = 2.0 * pi / 12.0
d = 5
fit f(x) 'points.in' skip 1 using 1:2 via a, b, d

set multiplot
set xrange [0:23]
set yrange [0:10]
plot 'points.in' using 1:2 title columnheader
plot f(x) notitle
unset multiplot
