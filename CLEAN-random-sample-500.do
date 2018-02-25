use "C:\Dropbox\data\contracting-usa-government-fedspending-dot-org\contracts-random-500-obs-RAW.dta", clear

gen effective_year=year(date(effectivedate,"MDY"))
gen effective_month=month(date(effectivedate,"MDY"))
gen effective_day=day(date(effectivedate,"MDY"))

gen signed_year=year(date(signeddate,"MDY"))
gen signed_month=month(date(signeddate,"MDY"))
gen signed_day=day(date(signeddate,"MDY"))


foreach v of varlist dollarsobligated currentcontractvalue ultimatecontractvalue {
	replace `v'=subinstr(`v',"$","",.)
	replace `v'=subinstr(`v',",","",.)
	destring(`v'), replace
}

compress
save "C:\Dropbox\data\contracting-usa-government-fedspending-dot-org\contracts-random-500-obs.dta", replace
export delimited using "C:\Dropbox\data\contracting-usa-government-fedspending-dot-org\contracts-random-500-obs.csv", replace
