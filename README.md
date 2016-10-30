# Multiple Regression Analysis

#### Authors: Morgan Smart and Lauren Hanlon

## Goal
Coduct a similar analysis to the ones performed by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani in Chapter 6, *Linear Regression*, in "An Introduction to Statistical Learning." Also write functions and test them using the R `testthat` package and output a slide deck using io slides.

## Replicating this analysis
1. Clone this gitHub folder `stat159-fall2016-project02`
2. Navigate to the parent directory and look at the file `session-info.txt` to know what libraries must be installed in order to run the analysis and other information generated from the output of the function `sessionInfo()`
3.  After verifying that you have the required packages and version of R, in the parent directory, run the command `make data` to download the dataset `Credit.csv` used for all testing and analysis
4. In the parent directory still, run the command `make tests` to test that the functions that generate regression summary statistics work (this is NOT in the paper, but was a requirment of the assignment).
5. Still in the parent directory, run the command `make all` to run the regression analysis, output images and `.RData` objects, knit `report.Rmd` to the final paper PDF output, and knit `slides.Rmd` to produce the slides describing the final paper in presentation form.

**NOTE:** You NEED to have the required R packages installed as well as LaTex in order for the command `make all` to run without producing any errors. 

## Licenses

All media content (e.g. report/., images/.) licensed under CC-BY  
[Creative Commons License](http://creativecommons.org/licenses/by-sa/4.0/) 
![creative commones license](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)

All code (e.g. code/.) licenced under the Apache License, Version 2.0: See file `LICENSE` to read the license


