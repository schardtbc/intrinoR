### `getSecurityIntradayPrices`
***
***

### Description

 Returns intraday prices for a security over requested time

### Usage
```r
getSecurityIntradayPrices(identifier, opts = list(),
  max_records = 1000)
```

### Arguments
Argument      |Description
------------- |----------------
```identifier```     |     String A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
```opts```     |     named list Optional query params for endpoint
```opts$start_date```     |     Date YYYY-MM-DD Return prices on or after the date
```opts$end_date```     |     Date YYYY-MM-DD Return prices on or before the date
```opts$start_time```     |     Date YYYY-MM-DD Return prices on or after the date
```opts$end_date```     |     Date YYYY-MM-DD Return prices on or before the date
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
  [`getSecurityRealtimePrice`](getSecurityRealtimePrice.md) ,
  [`getSecurityStockPrices`](getSecurityStockPrices.md) ,
  [`getSecurityZacksAnalystRatingsSnapshot`](getSecurityZacksAnalystRatingsSnapshot.md) 

