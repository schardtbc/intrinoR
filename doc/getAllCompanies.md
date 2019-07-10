### `getAllCompanies`

 Returns all Companies. When parameters are specified, returns matching companies.

### Usage

```r
getAllCompanies(opts = list())
```

### Arguments

Argument      |Description
------------- |----------------
```opts```     |     named list Optional parameters
```opts$latestFilingDate```     |     String YYYY-MM-DD Last filing date
```opts$sic```     |     String Return companies with the given Standard Industrial Classification code
```opts$template```     |     module:model/String Return companies with the given financial statement template
```opts$sector```     |     String Return companies in the given industry sector
```opts$industryCategory```     |     String Return companies in the given industry category
```opts$industryGroup```     |     String Return companies in the given industry group
```opts$hasFundamentals```     |     Boolean Return only companies that have fundamentals when true
```opts$hasStockPrices```     |     Boolean Return only companies that have stock prices when true
```opts$pageSize```     |     Number The number of results to return (default to 100)

### Returns

###  Other company endpoints:


  [`getCompanyDataPointHistory`](getCompanyDataPointHistory.md) ,
  [`getCompanyDataPointNumber`](getCompanyDataPointNumber.md) ,
  [`getCompanyDataPointText`](getCompanyDataPointText.md) ,
  [`getCompanyIPOs`](getCompanyIPOs.md) ,
  [`getCompanyNews`](getCompanyNews.md) ,
  [`getCompanySecurities`](getCompanySecurities.md) 


