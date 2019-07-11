

#' Lookup Fundamental
#' Returns the Fundamental for the Company with the given &#x60;identifier&#x60; and with the given parameters
#' @param identifier {String}  A Company identifier (Ticker, CIK, LEI, Intrinio ID)
#' @param statement_code {String} income_statment | balance_sheet_statement | cash_flow_statement | calculations The statement code
#' @param fiscal_year {Number} fiscalYear The fiscal year
#' @param fiscal_period {String} Q1TTM | Q2TTM | Q3TTM | FY | Q1 | Q2 | Q3 | Q4 | Q2YTD | Q3YTD The fiscal period
#' @family fundamental endpoints
#' @export
lookupFundamental <- function(identifier, statement_code, fiscal_year, fiscal_period) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/fundamentals/lookup/{identifier}/{statement_code}/{fiscal_year}/{fiscal_period}")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    ticker <- res$content$company$ticker
    res$content$company<-NULL
    res_data <- lapply(res$content,function(x)  ifelse(is.null(x),NA,x))
    df <- tibble::as_tibble(res_data)
    df <- tibble::add_column(df,symbol = ticker, .before = 1)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}

#' Returns detailed fundamental data for the given `id`.
#' @param id {String}  The Intrinio ID for the Fundamental
#' @family fundamental endpoints
#' @export
getFundamentalById <- function(id) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/fundamentals/{id}")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    ticker <- res$content$company$ticker
    res$content$company<-NULL
    res_data <- lapply(res$content,function(x)  ifelse(is.null(x),NA,x))
    df <- tibble::as_tibble(res_data)
    df <- tibble::add_column(df,symbol = ticker, .before = 1)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}

#' Returns professional-grade historical financial data. for the given `id`.
#'
#'  Returns professional-grade historical financial data.
#'  This data is standardized, cleansed and verified to ensure the highest quality
#'  data sourced directly from the XBRL financial statements. The primary purpose
#'  of standardized financials are to facilitate comparability across a single
#'  company’s fundamentals and across all companies' fundamentals.
#'
#' @param id {String}  The Intrinio ID for the Fundamental or lookup code (ticker-statement-year-period)
#'   for the Fundamental
#' @return standardized_financials {tibble} formated as deep table with one row per metric tag
#' @family fundamental endpoints
#' @export
getStandardizedFinancials <- function(id){
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/fundamentals/{id}/standardized_financials")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
    if (!res$status){
       id <- res$content$fundamental$id
       sf <- lapply(res$content$standardized_financials, function(x) c(x$data_tag, value = x$value))
       res_data <- lapply(sf,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
       df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
       df <- tibble::add_column(df,filing_date = res$content$fundamental$filing_date, .before =1)
       df <- tibble::add_column(df,fiscal_year = res$content$fundamental$fiscal_year, .before =1)
       df <- tibble::add_column(df,fiscal_period= res$content$fundamental$fiscal_period, .before =2)
       df <- tibble::add_column(df,type = res$content$fundamental$type, .before =3)
       df <- tibble::add_column(df,start_date = res$content$fundamental$start_date, .before =4)
       df <- tibble::add_column(df,end_date = res$content$fundamental$end_date, .before =5)
       df <- tibble::add_column(df,statement_code = res$content$fundamental$statement_code, .before =1)
       df <- tibble::add_column(df,fun_id = id, .before = 1)
       iresp <- getFundamentalById(id)
       df <- tibble::add_column(df,symbol = iresp$symbol, .before =1)
    } else {
      df <- tibble::as_tibble(list())
    }
    return (df)
}

#' Returns professional-grade historical financial data. for the given `id`.
#'
#'  Returns professional-grade historical financial data.
#'  This data is standardized, cleansed and verified to ensure the highest quality
#'  data sourced directly from the XBRL financial statements. The primary purpose
#'  of standardized financials are to facilitate comparability across a single
#'  company’s fundamentals and across all companies' fundamentals.
#'
#' @param id {String}  The Intrinio ID for the Fundamental or lookup code (ticker-statement-year-period)
#'   for the Fundamental
#' @return standardized_financials {tibble} formated as wide table with one column per metric tag
#' @family fundamental endpoints
#' @export
getStandardizedFinancialsTable <- function(id){
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/fundamentals/{id}/standardized_financials")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    id <- res$content$fundamental$id
    sf <- lapply(res$content$standardized_financials, function(x) c(x$data_tag, value = x$value))
    res_data <- lapply(sf,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    df <- tibble::add_column(df,filing_date = res$content$fundamental$filing_date, .before =1)
    df <- tibble::add_column(df,fiscal_year = res$content$fundamental$fiscal_year, .before =1)
    df <- tibble::add_column(df,fiscal_period= res$content$fundamental$fiscal_period, .before =2)
    df <- tibble::add_column(df,type = res$content$fundamental$type, .before =3)
    df <- tibble::add_column(df,start_date = res$content$fundamental$start_date, .before =4)
    df <- tibble::add_column(df,end_date = res$content$fundamental$end_date, .before =5)
    df <- tibble::add_column(df,statement_code = res$content$fundamental$statement_code, .before =1)
    df <- tibble::add_column(df,fun_id = id, .before = 1)
    iresp <- getFundamentalById(id)
    df <- tibble::add_column(df,symbol = iresp$symbol, .before =1)
    df <- df %>% dplyr::select(symbol,fun_id,statement_code,fiscal_year,fiscal_period,type,start_date,end_date,filing_date,tag,value) %>%
    dplyr::group_by(symbol,fun_id,statement_code) %>%
    tidyr::spread(tag,value)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}


#' Returns the As-Reported Financials directly from the financial
#'  statements of the XBRL filings from the company specified by the `id` param.
#'
#' @param id {String}  The Intrinio ID for the Fundamental or lookup code (ticker-statement-year-period)
#'   for the Fundamental
#' @return reported_financials {tibble} formated as wide table with one column per metric tag
#' @family fundamental endpoints
#' @export
getReportedFinancialsTable <- function(id){
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/fundamentals/{id}/reported_financials")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    id <- res$content$fundamental$id
    rf <- lapply(res$content$reported_financials, function(x) c(x$xbrl_tag, value = x$value))
    res_data <- lapply(rf,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    df <- tibble::add_column(df,filing_date = res$content$fundamental$filing_date, .before =1)
    df <- tibble::add_column(df,fiscal_year = res$content$fundamental$fiscal_year, .before =1)
    df <- tibble::add_column(df,fiscal_period= res$content$fundamental$fiscal_period, .before =2)
    df <- tibble::add_column(df,type = res$content$fundamental$type, .before =3)
    df <- tibble::add_column(df,start_date = res$content$fundamental$start_date, .before =4)
    df <- tibble::add_column(df,end_date = res$content$fundamental$end_date, .before =5)
    df <- tibble::add_column(df,statement_code = res$content$fundamental$statement_code, .before =1)
    df <- tibble::add_column(df,fun_id = id, .before = 1)
    iresp <- getFundamentalById(id)
    df <- tibble::add_column(df,symbol = iresp$symbol, .before =1)
    df <- df %>% dplyr::select(symbol,fun_id,statement_code,fiscal_year,fiscal_period,type,start_date,end_date,filing_date,tag,value) %>%
      dplyr::group_by(symbol,fun_id,statement_code) %>%
      tidyr::spread(tag,value)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}

#' Returns the As-Reported Financials directly from the financial
#'  statements of the XBRL filings from the company specified by the `id` param.
#'
#' @param id {String}  The Intrinio ID for the Fundamental or lookup code (ticker-statement-year-period)
#'   for the Fundamental
#' @return reported_financials {tibble} formated as deep table with one row per metric tag
#' @family fundamental endpoints
#' @export
getReportedFinancials <- function(id){
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/fundamentals/{id}/reported_financials")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    id <- res$content$fundamental$id
    rf <- lapply(res$content$reported_financials, function(x) c(x$xbrl_tag, value = x$value))
    res_data <- lapply(rf,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    df <- tibble::add_column(df,filing_date = res$content$fundamental$filing_date, .before =1)
    df <- tibble::add_column(df,fiscal_year = res$content$fundamental$fiscal_year, .before =1)
    df <- tibble::add_column(df,fiscal_period= res$content$fundamental$fiscal_period, .before =2)
    df <- tibble::add_column(df,type = res$content$fundamental$type, .before =3)
    df <- tibble::add_column(df,start_date = res$content$fundamental$start_date, .before =4)
    df <- tibble::add_column(df,end_date = res$content$fundamental$end_date, .before =5)
    df <- tibble::add_column(df,statement_code = res$content$fundamental$statement_code, .before =1)
    df <- tibble::add_column(df,fun_id = id, .before = 1)
    iresp <- getFundamentalById(id)
    df <- tibble::add_column(df,symbol = iresp$symbol, .before =1)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}

