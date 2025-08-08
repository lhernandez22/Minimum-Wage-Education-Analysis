**Final Project**
*Name: Lissette Hernandez

* put your files in a directory. create your filepath to to that directory
cd "C:\Users\lisse\OneDrive\Documents\Data Analytics\Final Project"

* open your IPUMS file
use "census2021.dta", clear
set seed 123
keep if runiform(0,1)<0.05 //keep a 5% random sample to make code run faster

* drop observations (people) who are born before 1960, and after 2000
drop if birthyr < 1960
drop if birthyr > 2000
rename year survey_year

* Year at age 17. Use to merge with minimum wage data.
gen year = birthyr + 17
label var year "Year when age 17"

*Convert FIPS to State names. Merge a file with state names and FIPS.

decode bpl, gen(state) //create state name of birth variable
preserve //replace capitalization in the minimum wage data
use "minwage.dta", clear
replace state = lower(state)
tempfile minwage_lowercase
save `minwage_lowercase'
restore 

*Merge with minimum wage
merge m:1 state year using `minwage_lowercase', keep(match) keepusing(effectiveminimumwage2020dollars) 

*********************
* Now, regress years of education on minimum wage when 17. 
* i.state = controls for state fixed effect; control for omitted variables, controls unobserved differences over time for different states. 
* i.year = controls for year fixed effects; controls for shared time trends in both variables 

rename effectiveminimumwage2020dollars minwage
gen anycollege = educ>=7 & educ<.
gen fouryear = educ>= 10
egen stateid = group(state) //generate a unique number corresponding to each state. Used for state fixed effects

reg anycollege minwage i.stateid i.year, cluster(stateid) // regression for anycollege w/fixed effects
reg fouryear minwage //regression for fouryear

** Outcome on left, policy variable on right
*Minimum wage in state of birth when they were 17 when they were deciding to attend college 

* Summary Statistic Table
sum anycollege fouryear educ minwage 
* need regression for attendance

* Figure of the relationship, netting out the controls
binscatter anycollege minwage, controls(i.stateid i.year)
binscatter fouryear minwage, controls(i.stateid i.year)
