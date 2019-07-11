### `getIndicesDataPointHistory`
***
***

### Description

 Stock Market Indices: "$SPX"   "$DJI"   "$DJA"   "$TRAN"  "$UTIL"  "$NDX"   "$COMPQ"

### Usage
```r
getIndicesDataPointHistory(identifier, tag = "level",
  type = "stock_market", opts = list(), rm.na = TRUE)
```

### Arguments
Argument      |Description
------------- |----------------
```identifier```     |     String A Index identifier (symbol, Intrinio ID)
```tag```     |     String An Intrinio data tag ID or code (defaults to `level``)
```opts```     |     named list Optional query params for endpoint
```opts$start_date```     |     Date YYYY-MM-DD Return prices on or after the date
```opts$end_date```     |     Date YYYY-MM-DD Return prices on or before the date
```opts$sort_order```     |     String = "desc" desc | asc
```opts$page_size```     |     number = 100 The number of results to return per page
### Seealso

 [https://data.intrinio.com/data-tags](https://data.intrinio.com/data-tags) 
 
 Other security endpoints: [`getAllSecurities`](getAllSecurities.md) ,
  [`getSecurityById`](getSecurityById.md) ,
  [`getSecurityDataPointHistory`](getSecurityDataPointHistory.md) ,
  [`getSecurityDataPointNumber`](getSecurityDataPointNumber.md) ,
  [`getSecurityDataPointText`](getSecurityDataPointText.md) ,
  [`getSecurityDividendsLatest`](getSecurityDividendsLatest.md) ,
  [`getSecurityEarningsLatest`](getSecurityEarningsLatest.md) ,
  [`getSecurityIntradayPrices`](getSecurityIntradayPrices.md) ,
  [`getSecurityRealtimePrice`](getSecurityRealtimePrice.md) ,
  [`getSecurityStockPrices`](getSecurityStockPrices.md) ,
  [`getSecurityZacksAnalystRatingsSnapshot`](getSecurityZacksAnalystRatingsSnapshot.md) 

