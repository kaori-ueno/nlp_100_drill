plot "data/49.txt" using 0:2:xtic(1) with boxes notitle
set terminal postscript eps enhanced 
set output "data/49.eps"
replot
