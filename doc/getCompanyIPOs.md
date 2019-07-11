### `getCompanyIPOs`
***
***

### Description

 Returns initial public offerings (IPOs). An IPO is a public offering of private company stock. The act of &quot;going public&quot; is initiated by an IPO, at which point the company's stock trades on a major stock exchange (such as NYSE or NASDAQ). Intrinio covers all upcoming and recent IPOs for US exchanges.

### Usage
```r
getCompanyIPOs(opts = list())
```

### Arguments
Argument      |Description
------------- |----------------
```opts```     |     named list Optional parameters
```opts.ticker```     |     String Return IPOs with the given ticker (typically the IPO for the company)
```opts.status```     |     String upcoming | priced | withdrwn Return IPOs with the given status. Upcoming IPOs are scheduled to occur in the future. Priced IPOs have occured and the company should be trading publicly. Withdrawn IPOs were planned to occurr but were withdrawn beforehand
```opts.start_date```     |     Date Return IPOs on or after the given date
```opts.end_date```     |     Date Return IPOs on or before the given date
```opts.offer_amount_greater_than```     |     Number Return IPOs with an offer dollar amount greater than the given amount
```opts.offer_amount_less_than```     |     Number Return IPOs with an offer dollar amount less than the given amount
```opts.page_ize```     |     Number The number of results to return (default to 100)
### Details

 Note: sandbox has no data for this endpoint

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

