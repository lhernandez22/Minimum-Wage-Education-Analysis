# Minimum-Wage-Education-Analysis
**Goal**: Analyze how minimum wage at 17 affects educational attainment, with a focus on community college enrollment. Using U.S. Census data and state minimum wage data, I explore whether higher teenage minimum wages influence the decision to attend or complete college.

## Dataset
1. American Community Survey (ACS), 2021 Census
- Provides demographic information, educational attainment, and birthplace/year.
2. Minimum Wage Data (Kaggle)
-  State and federal minimum wages by year; took the maximum of the two to represent binding wages.

## Methodology 
- Sample: Took a 5% random sample (out of 14M) from ACS data for efficiency.
- Restrictions: Looked at birth years between 1960 and 2000.
- Key Variable Construction:
  - `year = birthyr + 17` : Year each respondent turned 17.
  - Converted birthplace FIPS codes to state names.
- Merging:
  - Joined ACS data with minimum wage data by state and year.
- Regression Models:
  1.Any College Enrollment vs. Minimum Wage at 17  
     Fixed effects: state, birth year.
  2.Four-Year College Enrollment vs. Minimum Wage at 17  
     Fixed effects: state, birth year.
## Tools & Technologies
- STATA, Python, panel data, fixed effects regression

## Findings
- Regression 1:  
  - Every $1 increase in minimum wage leads to a 0.6 percentage point decrease in any college enrollment.
  - Effect is stronger for two-year/community colleges.
- Regression 2:  
  - Every $1 increase in minimum wage leads to a 3.5 percentage point decrease in four-year college enrollment.
- Across both models, coefficients are negative, suggesting higher teenage wages may raise the opportunity cost of college.
- Results support previous findings that higher minimum wages can reduce part-time community college enrollment.
- Policy implication: wage increases may have unintended consequences for postsecondary attainment among students balancing work and school.

## Files
- Stata Code: "final_project-2.do"
- Dataset: "minwage" & "census2021" (file was too big to insert; obtained from the census.gov)
