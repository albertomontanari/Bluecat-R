\name{bluecat_arno}
\alias{bluecat_arno}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Sample dataset - Arno River basin - Daily data
}
\description{
The data set consists of calibration data for the HyMod rainfall-runoff model applied to the Arno River basin at Subbiano, Italy. The basin has a drainage area of 751 km^2, with an elevation ranging from 259 m to 1622 m above sea level. The data set contains 19 years (i.e. from 1992-01-01 to 2011-12-31) of observed discharges (bluecat_arno$calib$qoss), and discharges simulated by the HyMod model (bluecat_arno$calib$qsim).
The data set also contains HyMod model predictions for the period 2012-01-01 to 2013-12-31 (bluecat_arno$dmodel$qsim) and corresponding observations (bluecat_arno$dmodel$qoss)}
\examples{
## Load data
data(bluecat_arno)

## Scatterplot of the calibration dataset
time<-arnosubbiano[,1]

par(mfrow=c(3,1),mar=c(4,5,2,1)) 
plot(bluecat_arno$dmodel$qoss,bluecat_arno$dmodel$qsim,col="red",ylab=expression("Simulated river flow (m"^3*"/s)"),xlab=expression("Simulated river flow (m"^3*"/s)"),xlim=c(0,max(c(qoss,bluecat_arno$dmodel$qsim,qoss,bluecat_arno$dmodel$qoss))),ylim=c(0,max(c(qoss,bluecat_arno$dmodel$qsim,qoss,bluecat_arno$dmodel$qoss))))
title(main="Arno@Subbiano HyMod model - Calibration data set - Observed versus simulated data",cex.main=1.2,col.main="darkblue")
abline(0,1)
grid()
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
