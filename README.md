# slamseq_EMbmm

here is to model the slamseq data with binomial mixture model and to estimate the parameters of interest using EM 

## To-do (main steps) 
  - estimate the global parameter Pe
    - from unlabeled samples for time points
    - using linear regression to predict the T-C mismatch rate   
  - estimate the global parameter Pc
    - direct estiamte using reads with more than m mismatches
    - EM algorith using estimated Pe in the previous step
  - estimate the gene-specific parameter Pi_g and associated confidence-interval using EM  