import excel using "C:\Users\simpson.ol\Downloads\NIPA.xls", clear firstrow
generate year = year(observation_date)
//browse year
generate month = month(observation_date)
//browse month
generate quarter = ceil(month/3)
//browse quarter
generate t = yq(year,quarter)
//browse t
format t %tq
rename GPDIC1 I
rename GCEC1 G
//twoway (line G t) (line I t)
//graph export "GI_time.png", replace
//regress I G, robust
tsset t 
generate dG = D.G 
generate dI = D.I 
//scatter dI dG 
//graph export "GI_quarter.png", replace
regress dI dG, robust
generate dG_sq = dG^2
regress dI dG dG_sq, robust
generate dI_pos = 0
replace dI_pos = 1 if dI > 0 & !mi(dI)
regress dI_pos dG, robust 
logit dI_pos dG, robust
