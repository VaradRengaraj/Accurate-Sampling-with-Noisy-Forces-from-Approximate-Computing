set terminal pdf enhanced
set encoding utf8
set output "figure4.pdf"
set multiplot

set xrange [0:500]
set style line 1 lc rgb "black" lw 1 pt 6
set style line 2 lc rgb "red" lw 2
set xlabel "Time t [fs]"
set ylabel "C_f_f(t)"

set style rectangle front lw 1
set object 1 rect from 52,0.18 to 80,0.26

plot "results/corr/autocorr" title "Autocorrelation of exact forces" with lp ls 1, "results/corr/autocorr_noisy" title "Autocorrelation of noisy forces" with l ls 2

set origin 0.25,0.5
set size 0.35,0.3
set xrange [60:72]
set yrange [0.2:0.24]
set xtics 60, 4, 72
set ytics 0.2, 0.02, 0.24
unset xlabel
unset ylabel
plot "results/corr/autocorr" title "" with lp ls 1, "results/corr/autocorr_noisy" title "" with l ls 2
