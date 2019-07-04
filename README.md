An R language wrapper for the Api [intrino](https://intrino.com) market
data Api.

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

Api reference documentation
---------------------------

[Api](https://docs.intrinio.com/documentation/api_v2/getting_started)
documentation.

Usage Example
-------------

    library(intrinoR)
    useSandbox()
    # useProduction()

    res <- getSecurityStockPrices("AAPL", opts = list(start_date = "2019-01-01"))
    res

    ## # A tibble: 126 x 14
    ##    symbol date  intraperiod frequency  open  high   low close volume
    ##    <chr>  <chr> <lgl>       <chr>     <dbl> <dbl> <dbl> <dbl>  <dbl>
    ##  1 AAPL   2019… FALSE       daily      201.  203.  201.  203. 1.69e7
    ##  2 AAPL   2019… FALSE       daily      203.  204.  201.  202. 2.73e7
    ##  3 AAPL   2019… FALSE       daily      199.  199.  197.  198. 3.11e7
    ##  4 AAPL   2019… FALSE       daily      200.  202.  200.  200. 2.09e7
    ##  5 AAPL   2019… FALSE       daily      198.  201.  197.  200. 2.61e7
    ##  6 AAPL   2019… FALSE       daily      198.  199.  195.  196. 2.11e7
    ##  7 AAPL   2019… FALSE       daily      199.  200.  198.  199. 1.82e7
    ##  8 AAPL   2019… FALSE       daily      199.  201.  198.  199. 4.78e7
    ##  9 AAPL   2019… FALSE       daily      200.  201.  198.  199. 2.15e7
    ## 10 AAPL   2019… FALSE       daily      200.  200.  197.  198. 2.11e7
    ## # … with 116 more rows, and 5 more variables: adj_open <dbl>,
    ## #   adj_high <dbl>, adj_low <dbl>, adj_close <dbl>, adj_volume <dbl>
