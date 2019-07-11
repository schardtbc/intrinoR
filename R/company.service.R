
#' Returns all Companies. When parameters are specified, returns matching companies.
#' @param opts {named list} Optional parameters
#' @param opts$latestFilingDate {String}  YYYY-MM-DD Last filing date
#' @param opts$sic {String}  Return companies with the given Standard Industrial Classification code
#' @param opts$template {module:model/String}  Return companies with the given financial statement template
#' @param opts$sector {String}  Return companies in the given industry sector
#' @param opts$industryCategory {String}  Return companies in the given industry category
#' @param opts$industryGroup {String}  Return companies in the given industry group
#' @param opts$hasFundamentals {Boolean}  Return only companies that have fundamentals when true
#' @param opts$hasStockPrices {Boolean}  Return only companies that have stock prices when true
#' @param opts$pageSize {Number} The number of results to return (default to 100)
#' @return companies {tibble}
#' @family company endpoints
#' @export
getAllCompanies <- function(opts = list()){
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- "/companies"
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
  if (!res$status){
    res_data <- lapply(res$content$companies,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    while (!is.null(res$content$next_page)) {
      res <- intrino_fetch(endpoint,res$content$next_page)
      if (!res$status) {
        res_data <- lapply(res$content$companies,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
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


#' Returns the Company with the given `identifier`
#' @param identifier A Company identifier (Ticker, CIK, LEI, Intrinio ID)
#' @return df {tibble}
#' @family company endpoints
#' @export
getCompany <- function(identifier) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/companies/{identifier}")
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

#' Returns Securities for the Company with the given `identifier`
#' @param identifier A Company identifier (Ticker, CIK, LEI, Intrinio ID)
#' @return companies {tibble}
#' @family company endpoints
#' @export
getCompanySecurities <- function(identifier) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/companies/{identifier}/securities")
  endpoint$query <- list()
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


#' Returns news for the Company with the given `identifier`
#' @param identifier A Company identifier (Ticker, CIK, LEI, Intrinio ID)
#' @param opts {named list} Optional query parameters
#' @param opts$page_size {number} Number of results returned per page default = 100
#' @param max_n {number} maximum results to return (defaults to 10)
#' @return companies {tibble}
#' @family company endpoints
#' @export
getCompanyNews <- function(identifier, opts = list(), max_n = 10) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/companies/{identifier}/news")
  if (max_n <100) {
    opts$page_size = max_n
  }
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
  if (!res$status){
    ticker <- res$content$company$ticker
    res_data <- lapply(res$content$news,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    while (!is.null(res$content$next_page) && nrow(df) < max_n) {
      res <- intrino_fetch(endpoint,res$content$next_page)
      if (!res$status) {
        res_data <- lapply(res$content$news,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
        np <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
        df <- dplyr::bind_rows(df,np)
      } else {
        break
      }
    }
    df <- tibble::add_column(df,symbol = ticker, .before=1)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}

#' Returns all Fundamentals for the Company with the given &#x60;identifier&#x60;. Returns Fundamentals matching parameters when supplied.
#' @param identifier {String}  A Company identifier (Ticker, CIK, LEI, Intrinio ID)
#' @param opts {named list}  Optional parameters
#' @param opts$filed_after {String} Date YYYY-MM-DD Filed on or after this date
#' @param opts$filed_before {String} Date YYYY-MM-DD Filed on or before this date
#' @param opts$reported_only {Boolean} Only as-reported fundamentals
#' @param opts$fiscal_year {Number}  Only for the given fiscal year
#' @param opts$statement_code {String} Only of the given statement code
#' @param opts$type  {String} Only of the given type
#' @param opts$start_date {String} Date YYYY-MM-DD Only on or after the given date
#' @param opts$end_date {String} Date YYYY-MM-DD Only on or before the given date
#' @param opts$page_size {Number} opts$pageSize The number of results to return (default to 100)
#' @return fundamentalds {tibble}
#' @family company endpoints
#' @export
getCompanyFundamentals <- function(identifier, opts = list()) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/companies/{identifier}/fundamentals")
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
  if (!res$status){
    ticker <- res$content$company$ticker
    res_data <- lapply(res$content$fundamentals,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    while (!is.null(res$content$next_page)) {
      res <- intrino_fetch(endpoint,res$content$next_page)
      if (!res$status) {
        res_data <- lapply(res$content$fundamentals,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
        np <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
        df <- dplyr::bind_rows(df,np)
      } else {
        break
      }
    }
    df <- tibble::add_column(df,symbol = ticker, .before=1)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}



#' Returns a complete list of SEC filings for the Company with the given &#x60;identifier&#x60;
#' @param identifier {String}  A Company identifier (Ticker, CIK, LEI, Intrinio ID)
#' @param opts {named list} Optional parameters
#' @param opts$report_type {String} Filter by &lt;a href&#x3D;\&quot;/documentation/sec_filing_report_types\&quot; target&#x3D;\&quot;_blank\&quot;&gt;report type&lt;/a&gt;. Separate values with commas to return multiple report types.
#' @param opts$start_date {String} Date YYYY-MM-DD Filed on or after the given date
#' @param opts$end_date {String} Date YYYY-MM-DD Filed before or after the given date
#' @param opts$page_size {Number}  The number of results to return (default to 100)
#' @return filings {tibble}
#' @family company endpoints
#' @export
getCompanyFilings <- function(identifier, opts = list()) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/companies/{identifier}/filings")
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
  if (!res$status){
    ticker <- res$content$company$ticker
    res_data <- lapply(res$content$filingsd,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    while (!is.null(res$content$next_page)) {
      res <- intrino_fetch(endpoint,res$content$next_page)
      if (!res$status) {
        res_data <- lapply(res$content$filings,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
        np <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
        df <- dplyr::bind_rows(df,np)
      } else {
        break
      }
    }
    df <- tibble::add_column(df,symbol = ticker, .before=1)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}


#' Returns current numerical value data-point tag for a company
#' @param identifier {String} A company identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
#' @param tag {String} An Intrinio data tag ID or code
#' @seealso \url{https://data.intrinio.com/data-tags}
#' @family company endpoints
#' @return {numeric}
#' @family company endpoints
#' @export
getCompanyDataPointNumber <- function(identifier, tag) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/company/{identifier}/data_point/{tag}/number")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    res$content
  }
  else {
    NA
  }
}


#' Returns current text value of data-point tag for a company
#' @param identifier {String} A company identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
#' @param tag {String} An Intrinio data tag ID or code
#' @seealso \url{https://data.intrinio.com/data-tags}
#' @family company endpoints
#' @return {String}
#' @family company endpoints
#' @export
getCompanyDataPointText <- function(identifier, tag) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/company/{identifier}/data_point/{tag}/text")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    res$content
  }
  else {
    NA
  }
}

#' Returns time series of historical values data-point tag for a company
#' @param identifier {String} A company identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)
#' @param tag {String} An Intrinio data tag ID or code
#' @param opts {named list} Optional query params for endpoint
#' @param opts$start_date {Date} YYYY-MM-DD Return prices on or after the date
#' @param opts$end_date': {Date} YYYY-MM-DD Return prices on or before the date
#' @param opts$sort_order {String = "desc"} desc | asc
#' @param opts$frequency: {String = "daily"} daily | weekly | monthly | quarterly | yearly Return stock prices in the given frequency
#' @param opts$type {String} FY | QTR | TTM Return historical data for given fiscal period type
#' @param opts$page_size': {number = 100} The number of results to return per page
#' @family company endpoints
#' @seealso \url{https://data.intrinio.com/data-tags}
#' @export
getCompanyDataPointHistory <- function(identifier,tag, opts=list()) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/company/{identifier}/historical_data/{tag}")
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


#' Returns initial public offerings (IPOs). An IPO is a public offering of private company stock. The act of \&quot;going public\&quot; is initiated by an IPO, at which point the company&#39;s stock trades on a major stock exchange (such as NYSE or NASDAQ). Intrinio covers all upcoming and recent IPOs for US exchanges.
#'
#' Note: sandbox has no data for this endpoint
#'
#' @param opts {named list}  Optional parameters
#' @param opts$ticker {String}  Return IPOs with the given ticker (typically the IPO for the company)
#' @param opts$status {String}  upcoming | priced | withdrwn Return IPOs with the given status. Upcoming IPOs are scheduled to occur in the future. Priced IPOs have occured and the company should be trading publicly. Withdrawn IPOs were planned to occurr but were withdrawn beforehand
#' @param opts$start_date {Date}  Return IPOs on or after the given date
#' @param opts$end_date {Date}  Return IPOs on or before the given date
#' @param opts$offer_amount_greater_than {Number}  Return IPOs with an offer dollar amount greater than the given amount
#' @param opts$offer_amount_less_than {Number}  Return IPOs with an offer dollar amount less than the given amount
#' @param opts$page_ize {Number}  The number of results to return (default to 100)
#' @return ipos {tibble}
#' @family company endpoints
#' @export
getCompanyIPOs <- function(opts = list()) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/companies/ipos")
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
  if (!res$status){
    res_data <- lapply(res$content$initial_public_offerings,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    while (!is.null(res$content$next_page)) {
      res <- intrino_fetch(endpoint,res$content$next_page)
      if (!res$status) {
        res_data <- lapply(res$content$initial_public_offerings,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
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
