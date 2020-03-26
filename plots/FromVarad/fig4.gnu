set terminal pdf enhanced
set encoding iso_8859_1
set output "force_autocorrelation1.pdf"
set xrange [0:500]
set style line 1  linecolor rgb "red" linewidth 3 pointtype 6 pointsize default
set style line 2  linecolor rgb "black" linewidth 3 pointtype 0 pointsize default
set xlabel "Time [fs]"
set ylabel "C_f_f(t)"
plot "results/corr/autocorr" title "" with lp ls 1, "results/corr/autocorr_noisy" title "" with lp ls 2
