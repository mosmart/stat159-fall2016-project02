## Code

### Scripts

`session-info-script.R` lists the required packages needed for this project, including `ggplot2`, `glmnet`, `stargazer`, `pls`, and `testthat`. It's output is saved in `session-info.txt` in the main directory.

`bash-info-script.sh` is a command line script that gives the versions used of git, latex and pandoc. Output is appended to `session-info.txt`

`eda-script.R` uploads the data from Credit.csv. It computes summary statistics of quantitative and qualitative variables. Creates a correlation matrix and scatterplot matrix. Anova matrix for qualitative variables. Data is saved in _data_ folder as `summary-stats.txt` and `eda-output.RData`. Correlation matrix is saved as `correlation-matrix.txt`. Anova is saved in `anova.txt`.

`data-processing-script.R` uploads the data from Credit.csv. It creates dummy variables then does mean centering and standardization on the variables. Saves the scaled data in the _data_ folder as `scaled-credit.csv`.

`osl-regression.R`, `pcr-regression.R`, `pls-regression.R`, `ridge-regression.R`, `lasso-regression.R` all construct regression models for their respective technique then cross-validates. All data is saved in _data_ folder as `[regression name]-cv.RData`. Images are saved in _images_ folder.

`regression-results.R` loads the data from the regressions and compares the output against one another. Output is saved in _data_ folder as `regression-results.RData`

`test-that.R` tests the data. Sources from `regression-functions.R` in _functions_ folder.

`train-test-data-script.R` creates the train and test datasets. Saves in the _data_ folder as `train-test.RData`.

### Functions

`regression-functions.R` contains functions to produe the residual sum of squares, total sum of squres, r-squared statistic, f-statistic as well as the residual standard error.

### Tests

`test-regression.R`contains tests using the `testthat` package for each function in `regression-functions.R`.
