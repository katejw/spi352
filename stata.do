import delimited "C:\Users\kp0756\OneDrive - Princeton University\spi352_data - results (1).csv", clear

tabulate group, summarize(approved)
tabulate group, summarize(interest_rate)

encode group, generate(group_id)
regress approved ib2.group_id, robust

import delimited "C:\Users\kp0756\OneDrive - Princeton University\spi352_data - mitigation.csv", clear

tabulate group, summarize(approved)
tabulate group, summarize(interest_rate)

encode group, generate(group_id)
regress approved ib2.group_id, robust

import delimited "C:\Users\kp0756\OneDrive - Princeton University\spi352_data - Sheet5.csv", clear

tabulate group approved if (group == "Group_B" | group == "Group_F"), row chi2
