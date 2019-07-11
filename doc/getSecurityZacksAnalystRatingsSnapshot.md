### `getSecurityZacksAnalystRatingsSnapshot`
***
***

### Description

 Also returns mean percentiles for comparing one security to the universe of securities
 covered by Zacks analyst ratings, at a specific point in time.

### Usage
```r
getSecurityZacksAnalystRatingsSnapshot(identifier, opts = list())
```

### Arguments
Argument      |Description
------------- |----------------
```identifier```     |     String A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
```opts```     |     named list Optional. queryParms
```opts$date```     |     String YYYY-MM-DD Lookup a historical snapshot on the given date
### Value

 tibble 

### Seealso

 Other security endpoints: [`getAllSecurities`](getAllSecurities.md) ,
  [`getIndicesDataPointHistory`](getIndicesDataPointHistory.md) ,
  [`getSecurityById`](getSecurityById.md) ,
  [`getSecurityDataPointHistory`](getSecurityDataPointHistory.md) ,
  [`getSecurityDataPointNumber`](getSecurityDataPointNumber.md) ,
  [`getSecurityDataPointText`](getSecurityDataPointText.md) ,
  [`getSecurityDividendsLatest`](getSecurityDividendsLatest.md) ,
  [`getSecurityEarningsLatest`](getSecurityEarningsLatest.md) ,
  [`getSecurityIntradayPrices`](getSecurityIntradayPrices.md) ,
  [`getSecurityRealtimePrice`](getSecurityRealtimePrice.md) ,
  [`getSecurityStockPrices`](getSecurityStockPrices.md) 

