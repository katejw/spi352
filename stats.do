import delimited "C:\Users\kp0756\OneDrive - Princeton University\llama_none.csv", clear

tabulate school_group, summarize(loan_approved)
tabulate school_group if loan_approved == 1, summarize(suggested_interest_rate)


tabulate school_group loan_approved if (school_group == "Group_A" | school_group == "Group_B"), row chi2
tabulate school_group loan_approved if (school_group == "Group_C" | school_group == "Group_B"), row chi2
tabulate school_group loan_approved if (school_group == "Group_D" | school_group == "Group_B"), row chi2

tabulate school_group loan_approved, row chi2
encode school_group, generate(school_group_n)

logistic loan_approved credit_score annual_income total_debt savings employment_years monthly_rent i.school_group_n

keep if loan_approved == 1

anova suggested_interest_rate i.school_group_n
pwcompare school_group_n, mcompare(tukey)

regress suggested_interest_rate credit_score annual_income total_debt savings employment_years monthly_rent i.school_group_n
