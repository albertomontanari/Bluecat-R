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
> install_github("albertomontanari/hymodbluecat")
> library(hymodbluecat)

To install the software in R under the Windows operating system first download and install Rtools from http://cran.r-project.org/bin/windows/Rtools/) and then:

> install.packages("devtools")
> library(devtools)
> find_rtools()
> install_github("albertomontanari/hymodbluecat")
> library(hymodbluecat)

Please note that the latest version of R may be needed, so beware of the warnings that you may get during installation.

If you wish to reinstall the package, beware that you need to detach it first, with the instruction

> detach("package:hymodbluecat", unload=TRUE)

You may also need to restart R before reinstalling.

The software comes with two data sets described in Koutsoyiannis and Montanari (2021). They refer to the Arno and Sieve River Basins, in Italy.
To reproduce the case study of the Arno River basin as presented by Koutsoyiannis and Montanari (2021) the following R commands can be used:

> data(bluecat_arno)

> pr4=bluecat.sim(resultcalib=bluecat_arno$calib,dmodelsim=bluecat_arno$dmodel$qsim,qoss=bluecat_arno$dmodel$qoss,plotflag=T,predsmodel="avg")

It is advisable to check that optimization gave back reasonable parameter values.

A detailed explanation of the argument of the functions bluecat.sim is given in the R help of Bluecat. To invoke it the following commands can be used:

> ?bluecat.sim

Please contact me if you would like additional help.
