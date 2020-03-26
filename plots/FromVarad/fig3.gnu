funcc(x) = ((1/(3.14*3000*.00008617))**1.5)*2*3.14*(x**0.5)*exp(-x/(3000*.00008617))
set terminal pdf enhanced
set output "maxwelldistribution.pdf"
set style line 2  linecolor rgb "black" linewidth 1 pointtype 0 pointsize default
set style line 1  linecolor rgb "red" linewidth 1 pointtype 6 pointsize default
set xrange [0:2.5]
set yrange [0.0001:10]
set samples 250
#set ytics 0,0.4,2
set title font ",20"
set xlabel "{/*1.5 E_k[eV]}"
set ylabel "{/*1.5 P(E_k) [eV^{-1}]}"
#set logscale xy 10
set logscale y
plot [0.005:2.5] 'results/maxwell/plt_data_normalized3'title "" with lp ls 1 , funcc(x)title ""  with lp ls 2
#plot  funcc(x)title ""  with lp ls 2 , 'results/maxwell/plt_data_normalized3'title "" with lp ls 1
