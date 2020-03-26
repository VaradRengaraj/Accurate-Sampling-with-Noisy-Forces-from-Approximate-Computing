set terminal pdf enhanced
set encoding iso_8859_1
set output "force_autocorrelation1.pdf"
set multiplot

set xrange [0:500]
set style line 1  linecolor rgb "black" linewidth 1 pointtype 6 pointsize default
set style line 2  linecolor rgb "red" linewidth 1 pointtype 0 pointsize default
set xlabel "Time [fs]"
set ylabel "C_f_f(t)"
plot "results/corr/autocorr" title "" with lp ls 1, "results/corr/autocorr_noisy" title "" with lp ls 2

set origin 0.2,0.5
set size 0.45,0.4
#set xrange [56:76]
#set yrange [0.15:0.25]
set xrange [60:72]
set yrange [0.2:0.24]
set ytics 0.2, 0.01, 0.24
unset xlabel
unset ylabel
plot "results/corr/autocorr" title "" with lp ls 1, "results/corr/autocorr_noisy" title "" with lp ls 2
