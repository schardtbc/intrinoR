### `getSecurityDataPointNumber`
***
***

### Description

 Returns current numerical value data-point tag for a security

### Usage
```r
getSecurityDataPointNumber(identifier, tag)
```

### Arguments
Argument      |Description
------------- |----------------
```identifier```     |     String A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
```tag```     |     String An Intrinio data tag ID or code
### Value

 numeric 

### Seealso

 [https://data.intrinio.com/data-tags](https://data.intrinio.com/data-tags) 
 
 Other security endpoints: [`getAllSecurities`](getAllSecurities.md) ,
  [`getIndicesDataPointHistory`](getIndicesDataPointHistory.md) ,
  [`getSecurityById`](getSecurityById.md) ,
  [`getSecurityDataPointHistory`](getSecurityDataPointHistory.md) ,
  [`getSecurityDataPointText`](getSecurityDataPointText.md) ,
  [`getSecurityDividendsLatest`](getSecurityDividendsLatest.md) ,
  [`getSecurityEarningsLatest`](getSecurityEarningsLatest.md) ,
  [`getSecurityIntradayPrices`](getSecurityIntradayPrices.md) ,
  [`getSecurityRealtimePrice`](getSecurityRealtimePrice.md) ,
  [`getSecurityStockPrices`](getSecurityStockPrices.md) ,
  [`getSecurityZacksAnalystRatingsSnapshot`](getSecurityZacksAnalystRatingsSnapshot.md) 

