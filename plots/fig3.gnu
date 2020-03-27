set terminal pdf enhanced
set encoding utf8
set output "figure3.pdf"

set xrange [0:100]
set yrange [0.00001:0.1]
set logscale y
set format y "10^{%T}"
set style line 1 lc rgb "red" pt 6
set style line 2 lc rgb "black" lw 1
set xlabel "{E_k [mE_h]}"
set ylabel "{PDF(E_k) [mE_h^{-1}]}"

funcc(x) = ((1/(3.14*3000*.00008617))**1.5)*2*3.14*((x*27.2114/1000)**0.5)*exp(-(x*27.2114/1000)/(3000*.00008617)) * 27.2114 / 1000
set samples 250

plot [0.005:100] 'results/maxwell/plt_data_normalized3' using ($1/27.2114*1000):($2*27.2114/1000) title "Kinetic energy distribution(noisy forces)" with p ls 1 , funcc(x) title "Analytic Maxwell distribution"  with l ls 2
