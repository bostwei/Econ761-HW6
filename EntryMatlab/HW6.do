********************************************************************
* Econ 761 Homework 6
* Shiyan Wei
* 12/11/2018
********************************************************************

** This script is try to use stata to do the probit and oprobit for Berry1992

set more off
clear all

* Today's date
local date = string(date(`"$S_DATE"',`"DMY"'),`"%tdCCYYNNDD"')

* Set to ,
* 		1 if working from Shiyan's SSCC server,
local computer=1

if `computer'==1 {
	* Set the master file path
	local filedir "U:\Econ 761\HW6\Econ761-HW6\EntryMatlab"
	* Set file separator depending on whether using Mac or PC
	local fileindic "/"
	cd "U:\Econ 761\HW6\Econ761-HW6\EntryMatlab"
}

cap log using HW6_`date'.log, replace

use Berry1992
****************** Question 1 ************************
**** Data descriptive ********************
* Note that the data is uniquely identify by car citypair year
gen year = int(yr_q/10)


gen lN = log(totenter)

* generate 97 entering indicator
bysort car citypair: gen enter97 =1 if enter==1 & year==1997
replace  enter97=0 if enter97==.

tab enter96

sum pop distance dist2 tourist city2 sharepaxdist numroute

****************** Question 2 ************************
**** 	Probit model			 ********************

probit enter97 pop distance dist2 tourist city2 sharepaxdist, vce(robust)
est store t5r1 

probit enter97 pop distance dist2 tourist city2  numroute, vce(robust)
est store t5r2

probit enter97 pop distance city2 sharepaxdist, vce(robust)
est store t5r3 


****************** Question 2 ************************
**** 	Probit model			 ********************


oprobit enter97 pop distance lN, vce(robust)
est store t6r1

oprobit enter97 pop distance city2 sharepaxdist lN, vce(robust)
est store t6r2


log close
