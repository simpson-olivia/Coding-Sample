use "C:\Users\simpson.ol\Downloads\NLSYdata (1).dta", clear
preserve
collapse income, by (afqt1989)
scatter income afqt1989
restore
regress income2018 afqt1989
regress income2018 afqt1989, robust
gen new_afqt1989 = afqt1989 - 50
regress income2018 new_afqt1989, robust
regress income2018 educ, robust
gen new_income2018 = income2018 / 1000
regress new_income2018 educ, robust
gen new_educ = educ / 10
regress income2018 new_educ, robust
summarize income2018 if educ == 4
summarize income2018 if educ == 5
