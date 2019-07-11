### `getSecurityRealtimePrice`
***
***

### Description

 realtime price for security

### Usage
```r
getSecurityRealtimePrice(identifier, opts = list())
```

### Arguments
Argument      |Description
------------- |----------------
```identifier```     |     String A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
```opts```     |     named list Optional query params for endpoint
```opts$source```     |     String iex | bats | bats_delayed | utp_delayed | cta_a_delayed | cta_b_delayed (defaults to best source availiable)
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
  [`getSecurityStockPrices`](getSecurityStockPrices.md) ,
  [`getSecurityZacksAnalystRatingsSnapshot`](getSecurityZacksAnalystRatingsSnapshot.md) 

