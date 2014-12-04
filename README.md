  Octave based Machine-learning routines

#### Setup

```bash
# ensure octave is installed
# get code
$ git clone https://github.com/partharamanujam/octave-ml.git
# include .../octave-ml/octavelib in the octave path 
# now check examples folder
```

## Features

#### Supervised Learning

  * Normal Equation - Linear Regression
  * Gradient Descent - Linear Regression
  * Gradient Descent - Logistic Regression
  * Support Vector Machines - Classification
  * Neural Networks - Classification : ToDo

#### Un-Supervised Learning

  * K Means - Clustering
  * Anomaly Detection - (Multivariate) Gaussian Distribution
  * Recommender Systems - Collaborative filtering (Low Rank Matrix Factorization)

#### Miscellaneous / Utilities

  * Feature Scaling/Normalization
  * Principal Component Analysis (Dimensionality Reduction)

## Installation Dependencies

  * Octave 3.6.4 or above - https://www.gnu.org/software/octave/download.html
  * Octave-Forge packages - http://octave.sourceforge.net
    - specfun
    - image
  * LIBSVM for Octave - http://www.csie.ntu.edu.tw/~cjlin/libsvm

## Philosophy

  Some of the commonly used Machine-learning and support routines implemented in Octave. This is to provide a starting point for more advanced work.

  See examples folder for usage.

#### Terminology / Conventions

###### Input-features

  Features are inputs from the training-set to be used for machine-learning. This is usually represented by the matrix-variable "X".

###### Outputs

  Outputs refer to the actual/known results corresponding to the input-features from the training-set. This is usually represented by the vector-variable "y".

###### Bias and Variance

  Bias refers to the erroneous assumptions in the learning algorithm, and Variance refers to the error from sensitivity to small fluctuations in the training set. For more details, refer to [Bias Variance Tradeoff](http://en.wikipedia.org/wiki/Bias%E2%80%93variance_tradeoff)

###### Theta-coefficients

  Theta refers to the hypothesis of coefficients/parameters that map/fit the input-features to the output-results. This is usually represented by the vector-variable "theta" (or Theta).

###### Lambda regularization-parameter

  Lambda is the regularization parameter used to manage fitting of parameters. This is usually represented by the vector-variable "lambda".

###### Feature scaling/normalization

  Feature scaling/normalization is the process of modifying the input-features to allow for better fitting. This is usually done using a combination of mean (represented by parameter mu), and standard-deviation (represented by parameter sigma). Note that the bias-term is usually not scaled/normalized.

###### Estimated-value

  Estimated-value refers to the predicted value for a given set of input-features using previously computed theta from the training-set. This is usually represented by the variable "p".

## Machine-Learning & Support Routines

  This section provides a list of various machine-learning and support routines available. For more detailed information, please look at the embedded documentation using 'help' for the specific routine.

#### [generateFeaturesPolynomial](octavelib/generateFeaturesPolynomial.m)

#### [addBiasTerm](octavelib/addBiasTerm.m)

#### [computeThetaByNormalEquation](octavelib/computeThetaByNormalEquation.m)

#### [predictByNormalEquation](octavelib/predictByNormalEquation.m)

#### [computeScalingParams](octavelib/computeScalingParams.m)

#### [scaleFeatures](octavelib/scaleFeatures.m)

#### [choosePolynomialForLinearGradDesc](octavelib/choosePolynomialForLinearGradDesc.m)

#### [chooseRegularizationForLinearGradDesc](octavelib/chooseRegularizationForLinearGradDesc.m)

#### [computeThetaByLinearGradDescFminunc](octavelib/computeThetaByLinearGradDescFminunc.m)

#### [linearRegressionCostFunction](octavelib/linearRegressionCostFunction.m)

#### [predictByLinearGradDesc](octavelib/predictByLinearGradDesc.m)

#### [chooseRegularizationForLogisticGradDesc](octavelib/chooseRegularizationForLogisticGradDesc.m)

#### [logisticRegressionOneVsAllTheta](octavelib/logisticRegressionOneVsAllTheta.m)

#### [predictByLogisticGradDescOneVsAll](octavelib/predictByLogisticGradDescOneVsAll.m)

#### [logisticRegressionOneVsAllError](octavelib/logisticRegressionOneVsAllError.m)

#### [computeThetaByLogisticGradDescFminunc](octavelib/computeThetaByLogisticGradDescFminunc.m)

#### [logisticRegressionCostFunction](octavelib/logisticRegressionCostFunction.m)

#### [sigmoid](octavelib/sigmoid.m)

#### [generateKMeansClustersMinCost](octavelib/generateKMeansClustersMinCost.m)

#### [generateKMeansClusters](octavelib/generateKMeansClusters.m)

#### [kMeansCostFunction](octavelib/kMeansCostFunction.m)

#### [kMeansInitCentroids](octavelib/kMeansInitCentroids.m)

#### [kMeansClosestCentroids](octavelib/kMeansClosestCentroids.m)

#### [kMeansComputeCentroids](octavelib/kMeansComputeCentroids.m)

#### [computePCA](octavelib/computePCA.m)

#### [projectPCAData](octavelib/projectPCAData.m)

#### [recoverPCAData](octavelib/recoverPCAData.m)

#### [chooseRBFParamsForSVM](octavelib/chooseRBFParamsForSVM.m)

#### [porterStemmer](octavelib/porterStemmer.m)

#### [computeGaussianParams](octavelib/computeGaussianParams.m)

#### [computeThresholdForMultivarGaussian](octavelib/computeThresholdForMultivarGaussian.m)

#### [computeMultivarGaussianDistribution](octavelib/computeMultivarGaussianDistribution.m)

#### [normalizeRatings](octavelib/normalizeRatings.m)

#### [computeCoFiParamsByGradDescFmincg](octavelib/computeCoFiParamsByGradDescFmincg.m)

#### [collaborativeFilteringCostFunction](octavelib/collaborativeFilteringCostFunction.m)

#### [fmincg](octavelib/fmincg.m)

## License

  * This code: [MIT](LICENSE)
  * Porter-Stemmer: [BSD](http://tartarus.org/martin/PorterStemmer)
  * fmincg: [&copy; Copyright 1999, 2000 & 2001, Carl Edward Rasmussen](octavelib/fmincg.m)
  * Examples data: Courtesy ML-007 class
