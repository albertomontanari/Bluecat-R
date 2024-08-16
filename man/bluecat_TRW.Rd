\name{bluecat_TRW}
\alias{bluecat_TRW}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Sample dataset - Trwee ring width as in Figure 5a of Franke et al. (2022)
}
\description{
The data set consists of the observed and simulated tree ring widths in Figure 5a of Franke et al. (2022). The data set contains a total of 600 data from 1401 to 2000 Data from 1401 to 1800 are used to calibrate Bluecat (bluecat_TRW$calib$qoss and bluecat_arno$TRW$qsim). Data from 1801 to 2000 are treated as model simulations for which uncertainty is assessed  (bluecat_TRW$dmodel$qsim). The corresponding observations are in bluecat_arno$dmodel$qoss.}
\examples{
## Load data
data(bluecat_TRW)

## Scatterplot of the calibration dataset
par(mfrow=c(3,1),mar=c(4,5,2,1)) 
plot(bluecat_TRW$dmodel$qoss,bluecat_TRW$dmodel$qsim,col="red",ylab="Simulated tree ring width",xlab="Observed tree ring width",xlim=c(min(c(qoss,bluecat_TRW$dmodel$qsim,qoss,bluecat_TRW$dmodel$qoss)),max(c(qoss,bluecat_TRW$dmodel$qsim,qoss,bluecat_TRW$dmodel$qoss))),ylim=c(min(c(qoss,bluecat_TRW$dmodel$qsim,qoss,bluecat_TRW$dmodel$qoss)),max(c(qoss,bluecat_TRW$dmodel$qsim,qoss,bluecat_TRW$dmodel$qoss))))
title(main="Tree ring widths - Calibration data set - Observed versus simulated data",cex.main=1.2,col.main="darkblue")
abline(0,1)
grid()
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
