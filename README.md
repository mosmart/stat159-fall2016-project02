# Project 2: Predictive Modeling

#### Authors: Morgan Smart and Lauren Hanlon

## Goal
Coduct a similar analysis to the ones performed by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani in Chapter 6, *Linear Regression*, in "An Introduction to Statistical Learning." Also write functions and test them using the R `testthat` package and output a slide deck using io slides.

## File Structure
<pre><code>
stat159-fall2016-project2/
   README.md
   Makefile
   LICENSE
   session-info.txt # contains versions used in project (output of session-info-script.R and bash-info-script.sh)
   .gitignore
   code/
    README.md
    functions/      # functions to run on regression models
        regression-functions.R
    scripts/        # EDA, scripts for each regression model and test/train data creation
        data-processing-script.R
        eda-script.R
        lasso-regression.R
        osl-regression.R
        pcr-regression.R
        pls-regression.R
        regression-results.R
        ridge-regression.R
        session-info-script.R
        test-that.R
        train-test-data-script.R
    tests/          # tests for regression functions
        test-regression.R
   data/              # contains all data for project including downloaded data and data created in project
    README.md
    Credit.csv
    anova.txt
    correlation-matrix.txt
    eda-output.RData
    lasso-cv.RData
    osl.RData
    pcr-cv.RData
    plsr-cv.RData
    regression-results.RData
    scaled-credit.csv 
    summary-stats.txt
    train-test.RData
   images/           # images created in the project to help with analysis
      ...
   report/           # report constructed from sections and presentation (slides)
    report.pdf
    report.Rmd
    sections/
        00-abstract.Rmd
        01-introduction.Rmd
        02-data.Rmd
        03-methods.Rmd
        04-analysis.Rmd
        05-results.Rmd
        06-conclusions.Rmd
slides/              # presentation of methodology and findings
    slides.Rmd
    slides.html
</code></pre>


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


