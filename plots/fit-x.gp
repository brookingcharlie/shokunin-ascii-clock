#!/usr/bin/env gnuplot

set terminal png

f(x) = a * sin(b * x + c) + d
b = 2.0 * pi / 12.0
d = 8.0
fit f(x) 'points.in' skip 1 using 1:3 via a, b, c, d

set multiplot
set xrange [0:23]
set yrange [0:16]
plot 'points.in' using 1:3 title columnheader
plot f(x) notitle
unset multiplot
