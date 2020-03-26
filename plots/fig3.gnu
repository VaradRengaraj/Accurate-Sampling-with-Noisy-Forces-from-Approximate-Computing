set terminal pdf enhanced
set encoding utf8
set output "figure3.pdf"

set xrange [0:2.5]
set yrange [0.0003:3]
set logscale y
set style line 1 lc rgb "red" pt 6
set style line 2 lc rgb "black" lw 1
set xlabel "{E_k [eV]}"
set ylabel "{P(E_k) [eV^{-1}]}"

funcc(x) = ((1/(3.14*3000*.00008617))**1.5)*2*3.14*(x**0.5)*exp(-x/(3000*.00008617))
set samples 250

plot [0.005:2.5] 'results/maxwell/plt_data_normalized3' title "Kinetic energy distribution(noisy forces)" with p ls 1 , funcc(x) title "Analytic Maxwell distribution"  with l ls 2
