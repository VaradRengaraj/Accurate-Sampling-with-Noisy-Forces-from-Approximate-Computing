# Collection of TODOs from the MDPI reviews:

## Reviewer 1
### Major
- [ ] My main issue is that it becomes only gradually clear that no approximate computation is actually performed in this work. Rather, forces that might be obtained from approximate computation are modelled in a specific way - by adding white noise. There is nothing wrong with that, but it should be made more clear earlier on. Even the title makes the reader expect actual approximate computing.
- [ ] Related to this, there is a larger assumption built into the whole thing that forces coming from approximate computing will, in fact, have the form of the exact forces plus white noise. This might very well be true, but it is a rather strong assumption and should be discussed in more detail.

### Intermediate
- [ ] If the authors claim that even the tail of the Maxwell distribution comes out accurately from the noisy calculation, perhaps Figure 3 could be presented on logarithmic scale?

### Minor
- [ ] It would help clarity if the authors specified explicitly early in the paper that the approximate computing applies specifically to the calculation of forces.
- [ ] At the beginning of Section 2, it would be helpful to state that double precision is the most common standard for accurate numerical computation.


### Typos
- [x] line 82: "a MD simulations"
- [x] line 102: "thitherto" (*This is actually no mistake but the word is very rarely used. Since the next sentence describes how the value is determined, I just removed the 'thitherto unknown'.*)

## Reviewer 2
- [ ] The Figures show that the computations with the newly developed methods almost yield the exact results, i.e., the random noise on the forces is indeed very well compensated for. However, I (and probably also many other readers) am wondering what the effect of this random noise would be if no compensation is active. I strongly recommend to add curves to the Figures (at least to Figure 1 and 2) where the simulation results with random noise and without any mitigation (i.e., standard time integration) are shown. Only then, it will be possible to see how much the newly developed approach actually improves the results.
- [ ] In general, I recommend to use SI units in scientific articles. While in some fields of science the use of certain non-SI units is very common, these units are rarely known in other fields of science, and a reader from such a field will struggle to correctly interpret the numbers. In the present manuscript, this concerns "Angstrom" and "eV". I recommend to replace these units by pm (or nm) and kJ/mol.
- [ ] In all four figures, it would be good to have insets which zoom in to "critical regions" (probably the first maximum/minimum in all four cases). With the current presentation style, it is hardly able to judge how much the approximative curves deviate from the correct result.
