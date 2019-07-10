intrinoR
--------

An R language wrapper for the [INTRINO](https://intrino.com) market data
Api.

You will need an account and api keys,
[signup](https://intrinio.com/signup) for a free starter account.

Installation
------------

To install as a dependancy into your project at the R REPL command
prompt

    install.github("schardtbc/intrinoR")

then in your .env or .Renviron file add the following keys

    INTRINO_BASE_URL = "https://api-v2.intrinio.com"
    INTRINO_PRODUCTION_KEY  = "your production key here"
    INTRINO_SANDBOX_KEY = " your sandbox key here"
    INTRINO_API_VERSION = "v2"

    # use production and snadbox keys from your intrino account
    # make sure the .env file is in your .gitignore file
    # do not hard code the keys into your application code
    # do not upload the keys to github.
    # you can easily change the keys at intrino.com if they become compromised

[Api
documentation](https://docs.intrinio.com/documentation/api_v2/getting_started)
documentation.

Usage Example
-------------

    library(intrinoR)
    useSandbox()
    # useProduction()

    res <- getSecurityStockPrices("AAPL", opts = list(start_date = "2019-01-01"))
    res

    ## # A tibble: 130 x 14
    ##    symbol date  intraperiod frequency  open  high   low close volume
    ##    <chr>  <chr> <lgl>       <chr>     <dbl> <dbl> <dbl> <dbl>  <dbl>
    ##  1 AAPL   2019… FALSE       daily      199.  202.  199.  201. 2.06e7
    ##  2 AAPL   2019… FALSE       daily      201.  201.  198.  200. 2.53e7
    ##  3 AAPL   2019… FALSE       daily      203.  205.  203.  204. 1.73e7
    ##  4 AAPL   2019… FALSE       daily      203.  204.  203.  204. 1.14e7
    ##  5 AAPL   2019… FALSE       daily      201.  203.  201.  203. 1.69e7
    ##  6 AAPL   2019… FALSE       daily      203.  204.  201.  202. 2.73e7
    ##  7 AAPL   2019… FALSE       daily      199.  199.  197.  198. 3.11e7
    ##  8 AAPL   2019… FALSE       daily      200.  202.  200.  200. 2.09e7
    ##  9 AAPL   2019… FALSE       daily      198.  201.  197.  200. 2.61e7
    ## 10 AAPL   2019… FALSE       daily      198.  199.  195.  196. 2.11e7
    ## # … with 120 more rows, and 5 more variables: adj_open <dbl>,
    ## #   adj_high <dbl>, adj_low <dbl>, adj_close <dbl>, adj_volume <dbl>


### Companies

|     | Endpoint                                      | function call              |
|-----|:----------------------------------------------|:-------------------------------------------------------------------|
| [X] | /companies                                    | [`getAllCompanies`](/doc/getAllCompanies.md)                       |
| [ ] | /companies/search                             |                                                                    |
| [X] | /companies/{identifier}                       | [`getCompany`](/doc/getCompany.md)                                 |
| [X] | /companies/{identifier}/securties             | [`getCompanySecurities`](/doc/getCompanySecurities.md)             |
| [X] | /companies/{identifier}/news                  | [`getCompanyNews`](/doc/getCompanyNews.md)                         |
| [X] | /company/{identifier}/fundamentals            | [`getCompanyFundamentals`](/doc/getCompanyFundamentals.md)         |
| [X] | /company/{identifier/filings}                 | [`getCompanyFilings`](/doc/getCompanyFilings.md)                   |
| [X] | /company/{identifier}/data_point/{tag}/number | [`getCompanyDataPointNumber`](/doc/getCompanyDataPointNumber.md)   |
| [X] | /company/{identifier}/data_point/{tag}/text   | [`getCompanyDataPointText`](/doc/getCompanyDataPointText.md)       |
| [X] | /company/{identifier}/historical_data/{tag}   | [`getCompanyDataPointHistory`](/doc/getCompanyDataPointHistory.md) |


