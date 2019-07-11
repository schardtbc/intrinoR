### `getCompanyIPOs`
***
***

### Description

 Note: sandbox has no data for this endpoint

### Usage
```r
getCompanyIPOs(opts = list())
```

### Arguments
Argument      |Description
------------- |----------------
```opts```     |     named list Optional parameters
```opts$ticker```     |     String Return IPOs with the given ticker (typically the IPO for the company)
```opts$status```     |     String upcoming | priced | withdrwn Return IPOs with the given status. Upcoming IPOs are scheduled to occur in the future. Priced IPOs have occured and the company should be trading publicly. Withdrawn IPOs were planned to occurr but were withdrawn beforehand
```opts$start_date```     |     Date Return IPOs on or after the given date
```opts$end_date```     |     Date Return IPOs on or before the given date
```opts$offer_amount_greater_than```     |     Number Return IPOs with an offer dollar amount greater than the given amount
```opts$offer_amount_less_than```     |     Number Return IPOs with an offer dollar amount less than the given amount
```opts$page_ize```     |     Number The number of results to return (default to 100)
### Value

 ipos tibble 

### Seealso

 Other company endpoints: [`getAllCompanies`](getAllCompanies.md) ,
  [`getCompanyDataPointHistory`](getCompanyDataPointHistory.md) ,
  [`getCompanyDataPointNumber`](getCompanyDataPointNumber.md) ,
  [`getCompanyDataPointText`](getCompanyDataPointText.md) ,
  [`getCompanyFilings`](getCompanyFilings.md) ,
  [`getCompanyFundamentals`](getCompanyFundamentals.md) ,
  [`getCompanyNews`](getCompanyNews.md) ,
  [`getCompanySecurities`](getCompanySecurities.md) ,
  [`getCompany`](getCompany.md) 

