# ATTENTION!

**This function has been eaten ([here](https://github.com/ben519/trinalysis/blob/master/R/sample_transactions.R)) by my R package [trinalysis](https://github.com/ben519/trinalysis) which has many useful methods for working with transaction data.**

---

# SampleTransactions

Single R function to generate random transaction data such that the simulated data has a (somewhat) realistic pattern of customer churn.

Sample use:

```R
# Transactions from 100 customers
transactions <- sampletransactions(Ncusts=100)

# Transactions from 100 customers with a standard deviation of 100 transactions per customer
transactions <- sampletransactions(Ncusts=100, sd.transactions=100)

# Transactions from 100 customers with a standard deviation of $100 per transaction
transactions <- sampletransactions(Ncusts=100, sd.amount=100)

# Transactions between 1/1/2015 and 12/31/2015
transactions <- sampletransactions(Ncusts=100, minDate=as.Date("2015-1-1"), maxDate=as.Date("2015-12-31"))

# Transactions falling into one of three categories
transactions <- sampletransactions(Ncusts=100, products=c("A", "B", "D"))
````
