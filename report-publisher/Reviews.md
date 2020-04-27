Dear Luzhou Wang, 

we would like to you for your efforts and the referees for their constructive 
reports, the modified manuscript has benefited substantially from their 
comments. In the following we discuss all the points raised by the referees, 
and have taken the opportunity to slightly polish the manuscript and clarify 
a few points.

We have also added the ORCID identifiers for authors Plessl and Kühne.

To simplify the revision process, we have marked our changes in color.

Best regards, 
Christian Plessl and Thomas D. Kühne
==============================================================================
## Reviewer 1
# The authors present a study on how to account for noise introduced by 
# approximate force calculations due to low machine precision. In modern 
# science, existing algorithms are often ported to accelerator devices such as 
# GPUs and FPGAs, which on the one hand yields a much higher execution speed 
# per unit of consumed energy (and money spent), but on the other hand often 
# sacrifices the precision of the computations to some degree (e.g., single-
# precision floating point units in common GPUs). Therefore, the subject of 
# the study is very important for the transition towards sustainable and 
# energy-efficient computational sciences.

# The article is well written, all methods used are sound, and the obtained 
# results are clearly communicated. Therefore, I can recommend the publication 
# of the manuscript in "Computation".

# I only have a few suggestions which might improve the article:

# (*) The Figures show that the computations with the newly developed methods 
# almost yield the exact results, i.e., the random noise on the forces is 
# indeed very well compensated for. However, I (and probably also many other 
# readers) am wondering what the effect of this random noise would be if no 
# compensation is active. I strongly recommend to add curves to the Figures 
# (at least to Figure 1 and 2) where the simulation results with random noise 
# and without any mitigation (i.e., standard time integration) are shown. Only 
# then, it will be possible to see how much the newly developed approach 
# actually improves the results.

We generally agree with the referee. Unfortunately, this is not possible since 
without our modified Langevin equation no valid ensemble would be sampled. 
Moreover, to demonstrate the high resilience wrt to random noise, the here 
reported noise levels a so high that without a proper compensation due to the 
damping the temperature instantly blows-up immediately leading to a numeric 
error and an abort of our program. 

# (*) In general, I recommend to use SI units in scientific articles. While in 
# some fields of science the use of certain non-SI units is very common, these 
# units are rarely known in other fields of science, and a reader from such a 
# field will struggle to correctly interpret the numbers. In the present 
# manuscript, this concerns "Angstrom" and "eV". I recommend to replace these 
# units by pm (or nm) and kJ/mol. 

We have followed the advise of the referee and are now using nm instead of 
Angstgrom and mHartree instead of eV through the manuscript and all figures. 

# (*) In all four figures, it would be good to have insets which zoom in to 
# "critical regions" (probably the first maximum/minimum in all four cases). 
# With the current # presentation style, it is hardly able to judge how much 
# the approximative curves deviate from the correct result.

We agree with the referee and have provided insets to zoom into the "critical 
regions" of Figs. 1,2 and 4. For Fig. 3 we have elected show it on a log scale, 
as suggested by referee 2, which immediately allows to judge on the agreement 
of the most important distribution tails. 


## Reviewer 2
# The manuscript entitled "Accurate Sampling with Noisy Forces from Approximate 
# Computing" deals with the interesting and timely topic of using modern hardware 
# efficiently in molecular simulations by decreasing the precision with which 
# numbers are represented. The introduction is clear, well written and to the 
# point. The writing in the rest of the manuscript is also good, with only a 
# couple of small issues listed at the end of this report for the authors' 
# reference. In my opinion, the manuscript can be published after some minor 
# revisions.

# My main issue is that it becomes only gradually clear that no approximate 
# computation is actually performed in this work. Rather, forces that might be 
# obtained from approximate computation are modelled in a specific way - by 
# adding white noise. There is nothing wrong with that, but it should be made 
# more clear earlier on. Even the title makes the reader expect actual approximate 
# computing. 

We agree with the referee and have rephrased the outline of the modified 
manuscript, which now reads: "In the approach presented in this paper, we mimic in 
software how it is possible to make effective use of low-precision special-purpose 
hardware for general-purpose scientific computing"

# Related to this, there is a larger assumption built into the whole thing that 
# forces coming from approximate computing will, in fact, have the form of the 
# exact forces plus white noise. This might very well be true, but it is a rather 
# strong assumption and should be discussed in more detail. If it is not valid in 
# practice, this paper is very relevant to approximate computing. These two points 
# should be addressed before the manuscript is published.

In the modified manuscript we have added the following paragraph to explicitly 
clarify that we have "assumed that the inaccuracies within the nuclear forces due 
to the usage of low-precision arithmetic operations to be approximately as white". 
In the methodology section we have also added a whole paragraph on the employed 
rounding technique and that "we assume the usage of such a rounding technique also 
for fixed-point arithmetic, leading to an only unbiased error within the computed 
interatomic forces.""

# If the authors claim that even the tail of the Maxwell distribution comes out 
# accurately from the noisy calculation, perhaps Figure 3 could be presented on 
# logarithmic scale?

We would like to thanks the referee for this insightful comment and have modified 
Fig. 3 in the revised manuscript accordingly. 

# Additionally, here are some suggestions that would, in my opinion, improve the 
# paper for the authors to consider. It would help clarity if the authors specified 
# explicitly early in the paper that the approximate computing applies specifically 
# to the calculation of forces. 

We have added the following sentences to the introduction and methodology sections 
of the revised version of our manuscript: "Yet, assuming that the inaccuracies within 
the nuclear forces ..." and "In the following, we assume the usage of such a rounding 
technique also for fixed-point arithmetic, leading to an only unbiased error within 
the computed interatomic forces.", respectively. 

# At the beginning of Section 2, it would be helpful to state that double precision 
# is the most common standard for accurate numerical computation.

We follow the advise of the referee and have modified the last sentence of the first 
paragrapbh of section 2, which now reads as: "A list of commonly used data types, ..., 
are shown in Table 1 beside the double-precision de facto standard"

# Typos to correct:
# line 82: "a MD simulations"
# line 102: "thitherto"

We have corrected these typos.
