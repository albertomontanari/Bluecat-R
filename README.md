# bluecat
Software working in the R environment for producing confidence limits of a generic prediction through comparison with observed data. Confidence limits are estimated by applying the BLUECAT method that transforms any deterministic model in a stochastic model, from which mean stochastic simulation and confidence limits are obtained.
For more details please refer to https:\\www.albertomontanari.it\bluecat

The following R libraries are needed to run the package:
- devtools

- DescTools

- DEoptim 

Furhtermore, the following libraries are needed to run the package under the Linux operating system:

-libxml2-dev

-libcurl4-openssl-dev

-libssl-dev

-libfontconfig1-dev

-libharfbuzz-dev

-libfribidi-dev

-libfreetype6-dev

-libpng-dev

-libtiff5-dev

-libjpeg-dev

-libharfbuzz-dev

Additional libraries may be needed depending on the Linux version. Under Ubuntu 24.04 they can be installed by the following Linux command line:

sudo apt-get install libxml2-dev libcurl4-openssl-dev libssl-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev libharfbuzz-dev

The R libraries can be installed with the following commands:

> install.packages("DescTools")

> install.packages("DEoptim")

> library(DescTools)

> library(DEoptim)

To install the software in R under the Linux operating system the following commands can be used:

> install.packages("devtools")

> library(devtools)

> install_github("albertomontanari/Bluecat-R")

> library(Bluecat-R)

To install the software in R under the Windows operating system first download and install Rtools from http://cran.r-project.org/bin/windows/Rtools/) and then:

> install.packages("devtools")

> library(devtools)

> find_rtools()

> install_github("albertomontanari/Bluecat-R")

> library(hymodbluecat)

Please note that the latest version of R may be needed, so beware of the warnings that you may get during installation.

If you wish to reinstall the package, beware that you need to detach it first, with the instruction

> detach("package:Bluecat-R", unload=TRUE)

You may also need to restart R before reinstalling.

The software comes with two data sets described in Montanari and Koutsoyiannis (2024, preprint). They refer to the prediction of tree ring withds and the prediction of daily river flow for the Arno River Basin, in Italy.

To reproduce the case studies presented by Montanari and Koutsoyiannis (2024, preprint) the following R commands can be used:

> data(bluecat_arno)

> pr1=bluecat.sim(bluecat_arno$resultcalib,bluecat_arno$dmodelsim,nmodels=2,qoss=bluecat_arno$dmodelsim$qoss,plotflag=T,predsmodel="avg",m=100,m1=80)

To reproduce the case study of uncertainty assessment for the tree ring width of Figure 5a of Franke et al. (2022):

> data(bluecat_TRW)

> pr1=bluecat.sim(resultcalib=bluecat_TRW$calib,dmodelsim=bluecat_TRW$dmodel$qsim,qoss=bluecat_TRW$dmodel$qoss,plotflag=T,predsmodel="avg",m=50,m1=40,empquant=F,paramd=c(0.1,1,1,NA),lowparamd=c(0.001,0.001,0.001,0),upparamd=c(1,10,20,0.1),cpptresh=-10000)

It is advisable to check that optimization gave back reasonable parameter values.

A detailed explanation of the argument of the functions bluecat.sim is given in the R help of Bluecat. To invoke it the following commands can be used:

> ?bluecat.sim

Please contact me if you would like additional help.

References

Franke, J., Evans, M. N., Schurer, A., & Hegerl, G. C. (2022). Climate change detection and attribution using observed and simulated tree-ring width. Climate of the past, 18(12), 2583-2597.

Koutsoyiannis, D., & Montanari, A. (2022). Bluecat: A local uncertainty estimator for deterministic simulations and predictions. Water Resources Research, 58(1), e2021WR031215.

Montanari, A. & Koutsoyiannis, D. (2024). Uncertainty estimation for environmental multimodel simulations: the BLUECAT approach and software. Submitted manuscript.

