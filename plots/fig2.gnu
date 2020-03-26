set terminal pdf enhanced
set encoding utf8
set output "figure2.pdf"
set multiplot

set xrange [0:0.7]
set yrange [0:3]
set style line 1 lc rgb "black" lw 3 dashtype 1
set style line 2 lc rgb "red" lw 3 dashtype 2
set style line 3 lc rgb "green" lw 3 dashtype 4
set style line 4 lc rgb "blue" lw 3 dashtype 3
set xlabel "r [nm]"
set ylabel "g(r)"

set style rectangle front lw 1
set object 1 rect from 0.22,2.5 to 0.27,2.85

plot "results/results1/ref/gofr.dat" using ($1/10):($2) title "Reference" with l ls 1, "results/results1/si_float_beta/gofr.dat" using ($1/10):($2) title "Floating-point error (10^{-0})" with l ls 2, "results/results1/si_float_beta_alpha1/gofr.dat" using ($1/10):($2) title "Floating-point error (10^{-1})" with l ls 3, "results/results1/si_float_beta_alpha2/gofr.dat" using ($1/10):($2) title "Floating-point error (10^{-2})" with l ls 4

set origin 0.1,0.6
set size 0.3,0.3
set xrange [0.235:0.255]
set yrange [2.5:2.8]
set xtics 0.24, 0.01, 0.25
set ytics 2.5, 0.2, 2.9
unset xlabel
unset ylabel
plot "results/results1/ref/gofr.dat" using ($1/10):($2) title "" with l ls 1, "results/results1/si_float_beta/gofr.dat" using ($1/10):($2) title "" with l ls 2, "results/results1/si_float_beta_alpha1/gofr.dat" using ($1/10):($2) title "" with l ls 3, "results/results1/si_float_beta_alpha2/gofr.dat" using ($1/10):($2) title "" with l ls 4
