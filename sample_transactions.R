# Load required packages
require(data.table)


sampletransactions <- function(Ncusts, sd.transactions=10, sd.amount=10, minDate=as.Date("2014-1-1"), maxDate=as.Date("2015-12-31"), products=LETTERS){
  # Method to build sample transactions dataset
  
  # Randomly sample Ncusts dates between min and max.  These will be the FirstTransaction dates for each customer
  dt <- data.table(CustomerID=seq(Ncusts), FirstTransactionDate=minDate + sample(as.integer(maxDate-minDate), size=Ncusts, replace=TRUE))
  
  # For each customer randomly determine the number of transactions
  dt[, Transactions:=abs(ceiling(rnorm(n=Ncusts, sd=sd.transactions)))]
  
  # For each customer, randomly determine transaction dates
  dt <- dt[, list(TransactionDate=c(FirstTransactionDate, FirstTransactionDate + abs(ceiling(rnorm(n=Transactions, sd=maxDate-minDate))))), by=list(CustomerID)]
  
  # Remove the dates past maxDate
  dt <- dt[TransactionDate<=maxDate]
  
  # Randomly determine Amount and Product
  dt[, `:=`(Amount=abs(round(rnorm(n=nrow(dt), sd=sd.amount),2)), Product=products[sample(length(products), size=nrow(dt), replace=TRUE)])]
  
  # Add TransactionID
  dt[, TransactionID:=.I]
  
  # Fix $0 transactions
  dt[Amount==0, Amount:=.01]
  
  # Set the column order
  setcolorder(dt, c("TransactionID", "TransactionDate", "CustomerID", "Amount", "Product"))
  
  setkey(dt, "TransactionID")
  return(dt)
}