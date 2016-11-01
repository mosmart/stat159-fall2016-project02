.PHONY: all data tests eda ols ridge lasso pcr plsr regressions report slides session sections clean

all: eda regressions sections report slides

data:
	cd ./data && { curl -O http://www-bcf.usc.edu/~gareth/ISL/Credit.csv ; cd -; }

tests: ./code/functions/regression-functions.R ./code/tests/test-regression.R
	cd ./code/scripts && { Rscript test-that.R ; cd -; }

eda: ./code/scripts/eda-script.R ./data/Credit.csv
	cd ./code/scripts && { Rscript eda-script.R ; cd -; }

ols: ./code/scripts/ols-regression.R ./data/Credit.csv
	cd ./code/scripts && { Rscript ols-regression.R ; cd -; }

ridge: ./code/scripts/ridge-regression.R ./data/Credit.csv
	cd ./code/scripts && { Rscript ridge-regression.R ; cd -; }

lasso: ./code/scripts/lasso-regression.R ./data/Credit.csv
	cd ./code/scripts && { Rscript lasso-regression.R ; cd -; }

pcr: ./code/scripts/pcr-regression.R ./data/Credit.csv
	cd ./code/scripts && { Rscript pcr-regression.R ; cd -; }

plsr: ./code/scripts/pls-regression.R ./data/Credit.csv
	cd ./code/scripts && { Rscript pls-regression.R ; cd -; }

regressions:
	make ols
	make ridge
	make lasso
	make pcr
	make plsr

sections: ./report/sections
	cat ./report/sections/*.Rmd > ./report/report.Rmd

report: ./report/report.Rmd ./data/*.RData ./images/*.png
	cd ./report && { Rscript -e "rmarkdown::render('report.Rmd')" ; cd -; }

slides:
	cd ./slides && { Rscript -e "rmarkdown::render(‘slides.Rmd')" ; cd -; }

session: ./code/scripts/session-info-script.R ./code/scripts/bash-info-script.sh
	cd ./code/scripts && { Rscript session-info-script.R ; cd -; }
	cd ./code/scripts && { sh bash-info-script.sh ; cd -; }

clean:
	rm -f ./report/report.pdf