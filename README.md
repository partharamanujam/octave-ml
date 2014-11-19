# INCOMPLETE - THIS IS WORK IN PROGRESS

  Octave based Machine-learning Routines

#### Setup

```bash
# ensure octave is installed
# get code
$ git clone https://github.com/partharamanujam/octave-ml.git
# include .../octave-ml/octaveml in the octave path 
# now check examples folder
```

## Features

  * Normal Equation - ToDo
  * Gradient Descent - ToDo
  * Neural Networks - ToDo
  * Support Vector Machines - ToDo

#### Installation Dependencies

  * Octave 3.6.4 or above - https://www.gnu.org/software/octave/download.html
  * Octave-Forge "specfun" package - http://octave.sourceforge.net/specfun

  Note: Ensure that the required packages are loaded at Octave startup

## Philosophy

  Some of the commonly used Machine-learning and support routines implemented in Octave. This is to provide a starting point for more advanced work.

  See examples folder for usage.

#### Naming Conventions

###### Input-features

  Features are inputs from the training-set to be used for machine-learning. This is usually represented by the matrix-variable "X".

###### Output-results

  Outputs refer to the actual/known results corresponding to the input-features from the training-set. This is usually represented by the vector-variable "y".

###### Bias and Variance

  Bias refers to the erroneous assumptions in the learning algorithm, and Variance refers to the error from sensitivity to small fluctuations in the training set. For more details, refer to [Bias Variance Tradeoff](http://en.wikipedia.org/wiki/Bias%E2%80%93variance_tradeoff)

###### Theta-coefficients

  Theta refers to the coefficients/parameters that map/fit the input-features to the output-results. This is usually represented by the vector-variable "theta".

###### Hypothesis

  Hypothesis refers to the predicted value for a given set of input-features using computed theta. This is usually represented by the variable "h".

## Machine-Learning & Support Routines

  This section provides a list of various machine-learning and support routines available. For more detailed information, please look at the embedded documentation using 'help' for the specific routine.

#### generateFeaturesPolynomial

#### addBiasTerm

#### computeThetaByNormalEquation

#### computeHypothesisByNormalEquation

## License

  [MIT](LICENSE)
