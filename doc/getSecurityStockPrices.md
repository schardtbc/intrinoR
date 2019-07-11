### `getSecurityStockPrices`
***
***

### Description

 Returns end-of-day prices for a security over requested time

### Usage
```r
getSecurityStockPrices(identifier, opts = list())
```

### Arguments
Argument      |Description
------------- |----------------
```identifier```     |     String A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
```opts```     |     named list Optional query params for endpoint
```opts$start_date```     |     Date YYYY-MM-DD Return prices on or after the date
```opts$end_date```     |     Date YYYY-MM-DD Return prices on or before the date
```opts$frequency```     |     String = "daily" daily | weekly | monthly | quarterly | yearly Return stock prices in the given frequency
```opts$page_size```     |     number = 100 The number of results to return per page
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
  [`getSecurityZacksAnalystRatingsSnapshot`](getSecurityZacksAnalystRatingsSnapshot.md) 

