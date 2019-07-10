#' All Securities
#' Returns all Securities to which you have access. When parameters are specified, returns matching Securities.
#' @param  opts {named list} Optional parameters
#' @param  opts$active {Boolean} When true, return securities that are active. When false, return securities that are not active. A security is considered active if it has traded or has had a corporate action in the past 30 days, and has not been merged into another security (such as due to ticker changes or corporate restructurings).
#' @param  opts$delisted {Boolean} When true, return securities that have been delisted from their exchange. Note that there may be a newer security for the same company that has been relisted on a differente exchange. When false, return securities that have not been delisted.
#' @param  opts$code {String} Return securities classified with the given code (&lt;a href&#x3D;\&quot;/documentation/security_codes\&quot; target&#x3D;\&quot;_blank\&quot;&gt;reference&lt;/a&gt;).
#' @param  opts$currency {String} Return securities traded in the given 3-digit ISO 4217 currency code (&lt;a href&#x3D;\&quot;https://en.wikipedia.org/wiki/ISO_4217\&quot; target&#x3D;\&quot;_blank\&quot;&gt;reference&lt;/a&gt;).
#' @param  opts$ticker {String} Return securities traded with the given ticker. Note that securities across the world (and through time) may trade with the same ticker but represent different companies. Use this in conjuction with other parameters for more specificity.
#' @param  opts$name {String} Return securities with the given text in their name (not case sensitive).
#' @param  opts$composite_mic {String} Return securities classified under the composite exchange with the given Market Identification Code (MIC). A composite exchange may or may not be a real exchange.  For example, the USCOMP exchange (our only composite exchange to date) is a combination of exchanges with the following MICs: ARCX, XASE, XPOR, FINR, XCIS, XNAS, XNYS, BATS.  This composite grouping is done for user convenience.  At this time, all US securities are classified under the composite exchange with MIC USCOMP.  To query for specific US exchanges, use the exchange_mic parameter below.
#' @param  opts$exchange_mic {String} The MIC code of the exchange where the security is actually traded.
#' @param  opts$stock_prices_after {Date} Return securities with end-of-day stock prices on or after this date.
#' @param  opts$stock_prices_before {Date} Return securities with end-of-day stock prices on or before this date.
#' @param  opts$cik {String} Return securities belonging to the company with the given Central Index Key (CIK).
#' @param  opts$figi {String} Return securities with the given Exchange Level FIGI (&lt;a href&#x3D;\&quot;https://www.openfigi.com/about\&quot; target&#x3D;\&quot;_blank\&quot;&gt;reference&lt;/a&gt;).
#' @param  opts$composite_figi {String} Return securities with the given Country Composite FIGI (&lt;a href&#x3D;\&quot;https://www.openfigi.com/about\&quot; target&#x3D;\&quot;_blank\&quot;&gt;reference&lt;/a&gt;).
#' @param  opts$share_class_figi {String} Return securities with the given Global Share Class FIGI (&lt;a href&#x3D;\&quot;https://www.openfigi.com/about\&quot; target&#x3D;\&quot;_blank\&quot;&gt;reference&lt;/a&gt;).
#' @param  opts$figi_unique_id {String} Return securities with the given FIGI Unique ID (&lt;a href&#x3D;\&quot;https://www.openfigi.com/about\&quot; target&#x3D;\&quot;_blank\&quot;&gt;reference&lt;/a&gt;).
#' @param  opts$include_non_figi {Boolean} When true, include securities that do not have a FIGI. By default, this is false. If this parameter is not specified, only securities with a FIGI are returned. (default to false)
#' @param  opts$page_size {Number = 100} The number of results to return
#' @return securities {data.frame}
#' @family security endpoints
#' @export
getAllSecurities <- function(opts = list()){
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- "/securities"
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
   if (!res$status){
     res_data <- lapply(res$content$securities,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
     df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
     while (!is.null(res$content$next_page)) {
       res <- intrino_fetch(endpoint,res$content$next_page)
       if (!res$status) {
         res_data <- lapply(res$content$securities,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
         np <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
         df <- dplyr::bind_rows(df,np)
       } else {
         break
       }
     }
  } else {
     df <- tibble::as_tibble(list())
  }
   return (df)
}


#' Lookup Security
#' Returns the Security with the given &#x60;identifier&#x60;
#' @param  identifier {String} A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
#' @return df {tibble}
#' @family security endpoints
#' @export
getSecurityById <- function(identifier) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/securities/{identifier}")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    res_data <- lapply(res$content,function(x)  ifelse(is.null(x),NA,x))
    df <- tibble::as_tibble(res_data)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}

#' end-of-day prices for a security over requested time
#' @param identifier {String} A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
#' @param opts {named list} Optional query params for endpoint
#' @param opts$start_date {Date} YYYY-MM-DD Return prices on or after the date
#' @param opts$end_date': {Date} YYYY-MM-DD Return prices on or before the date
#' @param opts$frequency: {String = "daily"} daily | weekly | monthly | quarterly | yearly Return stock prices in the given frequency
#' @param opts$page_size': {number = 100} The number of results to return per page
#' @family security endpoints
#' @export
getSecurityStockPrices <- function(identifier, opts=list()) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/securities/{identifier}/prices")
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
   if (!res$status){
     ticker <- res$content$security$ticker[[1]];
     res_data <- lapply(res$content$stock_prices,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
     df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
     while (!is.null(res$content$next_page)) {
       res <- intrino_fetch(endpoint,res$content$next_page)
       if (!res$status) {
         res_data <- lapply(res$content$stock_prices,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
         np <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
         df <- dplyr::bind_rows(df,np)
       } else {
         break
       }
     }
     df <- df %>% tibble::add_column(symbol = ticker, .before = 1)
   } else {
     df <- tibble::as_tibble(list())
   }
   return (df)
}


#' realtime price for security
#' @param identifier {String} A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
#' @param opts {named list} Optional query params for endpoint
#' @param opts$source {String} iex | bats | bats_delayed | utp_delayed | cta_a_delayed | cta_b_delayed (defaults to best source availiable)
#' @family security endpoints
#' @export
getSecurityRealtimePrice <- function(identifier, opts=list()) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/securities/{identifier}/prices/realtime")
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
  if (!res$status){
    ticker <- res$content$security$ticker;
    res$content$security <- NULL
    res_data <- lapply(res$content,function(x) ifelse(is.null(x),NA,x))
    df <- tibble::as_tibble(res_data) %>% tidyr::unnest()
    df <- df %>% tibble::add_column(symbol = ticker, .before = 1)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}

#' intraday prices for a security over requested time
#' @param identifier {String} A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
#' @param opts {named list} Optional query params for endpoint
#' @param opts$start_date {Date} YYYY-MM-DD Return prices on or after the date
#' @param opts$end_date'{Date} YYYY-MM-DD Return prices on or before the date
#' @param opts$start_time {Date} YYYY-MM-DD Return prices on or after the date
#' @param opts$end_date': {Date} YYYY-MM-DD Return prices on or before the date
#' @param opts$page_size' {number = 100} The number of results to return per page
#' @family security endpoints
#' @export
getSecurityIntradayPrices <- function(identifier, opts=list(), max_records = 1000) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/securities/{identifier}/prices/intraday")
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
  if (!res$status){
    ticker <- res$content$security$ticker[[1]];
    res_data <- lapply(res$content$intraday_prices,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    while (!is.null(res$content$next_page) && nrow(df) <= max_records) {
      res <- intrino_fetch(endpoint,res$content$next_page)
      if (!res$status) {
        res_data <- lapply(res$content$intraday_prices,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
        np <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
        df <- dplyr::bind_rows(df,np)
        show(nrow(df))
      } else {
        break
      }
    }
    df <- df %>% tibble::add_column(symbol = ticker, .before = 1)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}


#' Returns the latest available dividend information for the Security with the given `identifier`
#' @param identifier {String} A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
#' @family security endpoints
#' @export
getSecurityDividendsLatest <- function(identifier) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/securities/{identifier}/dividends/latest")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    ticker <- res$content$security$ticker;
    res$content$security <- NULL
    res_data <- lapply(res$content,function(x) ifelse(is.null(x),NA,x))
    df <- tibble::as_tibble(res_data) %>% tidyr::unnest()
    df <- df %>% tibble::add_column(symbol = ticker, .before = 1)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}

#' Returns latest available earnings information for the Security with the given `identifier`
#' @param identifier {String} A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
#' @family security endpoints
#' @export
getSecurityEarningsLatest <- function(identifier) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/securities/{identifier}/earnings/latest")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    ticker <- res$content$security$ticker;
    res$content$security <- NULL
    res_data <- lapply(res$content,function(x) ifelse(is.null(x),NA,x))
    df <- tibble::as_tibble(res_data) %>% tidyr::unnest()
    df <- df %>% tibble::add_column(symbol = ticker, .before = 1)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}

#' Returns a snapshot of ratings data compared with previous timeframes for the Security with the given `identifier`.
#'
#'   Also returns mean percentiles for comparing one security to the universe of securities
#'    covered by Zacks analyst ratings, at a specific point in time.
#'
#' @param identifier {String} A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
#' @param opts {named list} Optional. queryParms
#' @param opts$date {String} YYYY-MM-DD Lookup a historical snapshot on the given date
#' @family security endpoints
#' @return {tibble}
#' @export
getSecurityZacksAnalystRatingsSnapshot <- function(identifier, opts = list()) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/securities/{identifier}/zacks/analyst_ratings/snapshot")
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
  if (!res$status){
    ticker <- res$content$security$ticker;
    res$content$security <- NULL
    res_data <- lapply(res$content$snapshots,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    df <- df %>% tibble::add_column(symbol = ticker, .before = 1)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}


#' current numerical value data-point tag for a security
#' @param identifier {String} A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
#' @param tag {String} An Intrinio data tag ID or code
#' @seealso \url{https://data.intrinio.com/data-tags}
#' @family security endpoints
#' @return {numeric}
#' @export
getSecurityDataPointNumber <- function(identifier, tag) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/securities/{identifier}/data_point/{tag}/number")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    res$content
  }
  else {
    NA
  }
}


#' current text value of data-point tag for a security
#' @param identifier {String} A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
#' @param tag {String} An Intrinio data tag ID or code
#' @seealso \url{https://data.intrinio.com/data-tags}
#' @family security endpoints
#' @return {String}
#' @export
getSecurityDataPointText <- function(identifier, tag) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/securities/{identifier}/data_point/{tag}/text")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    res$content
  }
  else {
    NA
  }
}

#' historical values data-point tag for a security over specified time range
#' @param identifier {String} A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
#' @param tag {String} An Intrinio data tag ID or code
#' @param opts {named list} Optional query params for endpoint
#' @param opts$start_date {Date} YYYY-MM-DD Return prices on or after the date
#' @param opts$end_date': {Date} YYYY-MM-DD Return prices on or before the date
#' @param opts$sort_order {String = "desc"} desc | asc
#' @param opts$frequency: {String = "daily"} daily | weekly | monthly | quarterly | yearly Return stock prices in the given frequency
#' @param opts$page_size': {number = 100} The number of results to return per page
#' @family security endpoints
#' @seealso \url{https://data.intrinio.com/data-tags}
#' @export
getSecurityDataPointHistory <- function(identifier,tag, opts=list()) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/securities/{identifier}/historical_data/{tag}")
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
  if (!res$status){
    ticker <- res$content$security$ticker[[1]];
    res_data <- lapply(res$content$historical_data,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    while (!is.null(res$content$next_page)) {
      res <- intrino_fetch(endpoint,res$content$next_page)
      if (!res$status) {
        res_data <- lapply(res$content$historical_data,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
        np <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
        df <- dplyr::bind_rows(df,np)
      } else {
        break
      }
    }
    df <- df %>% tibble::add_column(symbol = ticker, .before = 1)
    df <- df %>% dplyr::rename(!!tag := value)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}
