\name{bluecat.sim}
\alias{bluecat.sim}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Software working in the R environment for producing confidence limits of a generic prediction, obtained via a single model or multiple models, through comparison with observed data. Confidence limits are estimated by applying the BLUECAT method that transforms any deterministic model in a stochastic model, from which mean stochastic simulation and confidence limits are obtained. For more details please refer to https:\www.albertomontanari.it\bluecat, Koutsoyiannis and Montanari (2022) and Montanari and Koutsoyannis (2024, preprint)}
\description{
The function takes as input a calibration data set formed by deterministic model predictions and corresponding observed values, for one or more models. By comparing prediction with observation BLUECAT corrects the prediction itself and computes confidence bands. The function requires the libraries "devtools", "DescTools" and "DEoptim".}
\usage{
bluecat.sim<-function(resultcalib,dmodelsim,nmodels=1,uncmeas=2, predsmodel="avg",empquant=F,siglev=0.2,m=100,m1=80,paramd=c(0.1,1,10,NA),lowparamd=c(0.001,0.001,0.001,0),upparamd=c(1,5,20,NA),qoss=NULL,plotflag=F,cpptresh=-Inf)}
\arguments{
\item{resultcalib}{It is a list with elements $qsim and $qoss for each prediction model in this order: qsim model 1, qoss model 1, qsim model 2, qoss model 2 and so on.}
\item{dmodelsim}{List of deterministic model prediction whose uncertainty is to be estimated, in this order: qsim1, qsim2, ...., qoss.}
\item{Nmodels}{Number of models in the multimodel simulation.}
\item{unmeas}{Uncertainty measure for identifying the best performing model in the multimodel simulation, at each prediction step. Values are 1 for width of the confidence band, 2 for width of the confidence band divided by the stochastic prediction, 3 for the difference between the deterministic and stochastic prediction, 4 for the difference between the deterministic and stochastic prediction divided by the stochastic prediction.}
\item{predsmodel}{Character variable to specify if stochastic prediction is generated by the mean (predsmodel="avg") or the median (predsmodel="mdn") of the conditional distribution. Default is predsmodel="avg".}
\item{empquant}{Logical variable to specify if empirical quantiles or robust estimation is to be used for estimating confidence limits. Default is robust estimation, namely, empquant=F.}
\item{siglev}{Significance level for confidence limits estimation. Default is siglev=0.2}
\item{m}{Parameter to determine the sample size of river flow neighbours to be used for estimating the probability distribution of true river flow conditioned to the simulated river flow. Default is m=100.}
\item{m1}{Number of k-moments used to estimate the PBF distribution on the sample of mean stochastic prediction to make robust quantile estimation. Default is m1=80.}
\item{paramd}{Initial parameter values for the PBF distribution fitting the sample of mean stochastic prediction to make robust quantile estimation. Default is paramd=c(0.1,1,10,NA).}
\item{lowparamd}{Lower bound for the parameter values of the PBF distribution fitting the sample of mean stochastic prediction to make robust quantile estimation. Default is lowparamd=c(0.001,0.001,0.001,0).}
\item{upparamd}{Upper bound for the parameter values of the PBF distribution fitting the sample of mean stochastic prediction to make robust quantile estimation. Default is upparamd=c(1,5,20,NA).}
\item{qoss}{Vector of observed data corresponding to the model prediction whose uncertainty is to be estimated if available. It is not necessary for uncertainty estimation. If provided, it must have the same length as the vector of modelprediction dmodelsim.}
\item{plotflag}{Logical value. Specifies if diagnostic is to be returned. Default is plot=F. If plot=T a scapperplot of observed versus simulated by the stochastic model river flows is returned along with its efficiency. The diagnostic plots are also returned, along with the percentage of observations lying outside the confidence bands.}
\item{cpptresh}{Low flow threshold to draw the diagnostic plots and to compute percentage of points lying outside the confidence band. Default value is cpptresh=0, which means that zero values for the simulated river flow are not considered when drawing the plots and computing percentages.}
}

\value{A list with the following items is returned:
\item{outputlist$detprediction}{It is a list of deterministic model outputs for each considered model and the multimodel simulation.}
\item{outputlist$stochprediction}{It is a list of stochastic model outputs for each considered model and the multimodel simulation.}
\item{outputlist$lowlimit}{List with lower confidence limit obtained with BLUECAT for each considered model and the multimodel simulation.}
\item{outputlist$uplimit}{List with lower confidence limit obtained with BLUECAT for each considered model and the multimodel simulation.}
\item{posminn}{Identification number of the best prediction model at each time step.}}

\details{
Uncertainty is estimated by applying BLUECAT, "A Brisk Local Uncertainty Estimator for Hydrologic Simulations and Predictions", introduced by Koutsoyiannis and Montanari (2022). BLUECAT estimates the lower and upper confidence limits of the HyMod simulation for a given confidence level. Goodness of fit testing for BLUECAT is performed by plotting a scatterplot of observed river flow against the mean stochastic simulation obtained with BLUECAT along with the related confidence limits, by plotting the Coverage Probability Plot and computing the Prediction Technical Performance indexes as in Koutsoyiannis and Montanari (2022).}

\author{Demetris Koutsoyiannis and Alberto Montanari, email: alberto.montanari@unibo.it.}

\references{
Franke, J., Evans, M. N., Schurer, A., & Hegerl, G. C. (2022). Climate change detection and attribution using observed and simulated tree-ring width. Climate of the past, 18(12), 2583-2597.
Koutsoyiannis, D., & Montanari, A. (2022). Bluecat: A local uncertainty estimator for deterministic simulations and predictions. Water Resources Research, 58(1), e2021WR031215.
Montanari, A. & Koutsoyiannis, D. (2024). Uncertainty estimation for environmental multimodel simulations: the BLUECAT approach and software. Submitted manuscript.
}

\examples{
## Uncertainty estimation for the multimodel simulated river flow of the Arno River at Subbiano (see Koutsoyiannis and Montanari (2022) for details on this case study and Montanari and Koutsoyannis (2024) for details on multimodel simulation with BLUECAT):
## Load data
data(bluecat_arno)
pr1=bluecat.sim(bluecat_arno$resultcalib,bluecat_arno$dmodelsim,nmodels=2,qoss=bluecat_arno$dmodelsim$qoss,plotflag=T,predsmodel="avg",m=100,m1=80)

## Uncertainty estimation for the simulated tree ring width of Figure 5a of Franke et al. (2022):
## Load data
data(bluecat_TRW)
pr1=bluecat.sim(resultcalib=bluecat_TRW$calib,dmodelsim=bluecat_TRW$dmodel$qsim,qoss=bluecat_TRW$dmodel$qoss,plotflag=T,predsmodel="avg",m=50,m1=40,empquant=F,paramd=c(0.1,1,1,NA),lowparamd=c(0.001,0.001,0.001,0),upparamd=c(1,10,20,0.1),cpptresh=-10000)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Hydrology}
\keyword{BLUECAT}
\keyword{Uncertainty}% __ONLY ONE__ keyword per line
