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

> data(arnosubbiano)

> pr1=hymod.par(c(100,1,0.5,200,0.5),area=752,tdelta=86400,e=arnosubbiano[,3][1:7305],p=arnosubbiano[,2][1:7305],nstep=length(arnosubbiano[,2][1:7305]),qoss=arnosubbiano[,4][1:7305],qinitial=15,lower=c(10,0.1,0.1,0.1,0.1),upper=c(800,10,0.9,1000,100),opt="DEoptim")

Before moving forward it is advisable to check that optimization gave back reasonable parameter values.

> pr2=hymod.sim(pr1$par,area=752,tdelta=86400,e=arnosubbiano[,3][1:7305],p=arnosubbiano[,2][1:7305],qinitial=15,qoss=arnosubbiano[,4][1:7305],resultcalib=pr1,bluecat=T,empquant=F,plot=T)

> pr3=hymod.sim(pr1$par,area=752,tdelta=86400,e=arnosubbiano[,3][7306:8036],p=arnosubbiano[,2][7306:8036],qinitial=15,qoss=arnosubbiano[,4][7306:8036],resultcalib=pr1,bluecat=T,empquant=F,plot=T)

A detailed explanation of the argument of the functions hymod.par and hymod.sim is given in the R help. To invoke it the following commands can be used:

> ?bluecat.sim

Please contact me if you would like additional help.
