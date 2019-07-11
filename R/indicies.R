

#' Return Stock Market Indices Meta-Data
#' @param opts {named list} Optional query parameters
#' @param opts$page_size the number of results to return (defaults to 100)
#' @family indices endpoints
#' @export
getAllStockMarketIndicies <- function(opts = list()){
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- "/indices/stock_market"
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
  if (!res$status){
    res_data <- lapply(res$content$indices,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    while (!is.null(res$content$next_page)) {
      res <- intrino_fetch(endpoint,res$content$next_page)
      if (!res$status) {
        res_data <- lapply(res$content$indices,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
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

#' Return Econpmic Indices Meta-Data
#' @param opts {named list} Optional query parameters
#' @param opts$page_size the number of results to return (defaults to 100)
#' @family indices endpoints
#' @export
getAllEconomicIndicies <- function(opts = list()){
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- "/indices/economic"
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
  if (!res$status){
    res_data <- lapply(res$content$indices,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    while (!is.null(res$content$next_page)) {
      res <- intrino_fetch(endpoint,res$content$next_page)
      if (!res$status) {
        res_data <- lapply(res$content$indices,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
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

#' Return SIC Indices Meta-Data
#' @param opts {named list} Optional query parameters
#' @param opts$page_size the number of results to return (defaults to 100)
#' @family indices endpoints
#' @export
getAllSicIndicies <- function(opts = list()){
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- "/indices/sic"
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
  if (!res$status){
    res_data <- lapply(res$content$indices,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
    df <- tibble::as_tibble(do.call(rbind,res_data)) %>% tidyr::unnest()
    while (!is.null(res$content$next_page)) {
      res <- intrino_fetch(endpoint,res$content$next_page)
      if (!res$status) {
        res_data <- lapply(res$content$indices,function(x) lapply(x, function(y) ifelse(is.null(y),NA,y)))
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


#' Returns current numerical value data-point tag for an index
#' @param identifier {String} A Index identifier (symbol, Intrinio ID)
#' @param tag {String} An Intrinio data tag ID or code
#' @seealso \url{https://data.intrinio.com/data-tags}
#' @family indices endpoints
#' @return {numeric}
#' @export
getIndicesDataPointNumber <- function(identifier, tag = "level", type = "stock_market") {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/indices/{type}/{identifier}/data_point/{tag}/number")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    res$content
  }
  else {
    NA
  }
}


#' Returns current text value of data-point tag for an index
#' @param identifier {String} A Security identifier (index symbol, Intrinio ID)
#' @param tag {String} An Intrinio data tag ID or code
#' @seealso \url{https://data.intrinio.com/data-tags}
#' @family indices endpoints
#' @return {String}
#' @export
getIndicesDataPointText <- function(identifier, tag= "level", index = "stock_market") {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/indices/{type}/{identifier}/data_point/{tag}/text")
  endpoint$query <- list()
  res <- intrino_fetch(endpoint)
  if (!res$status){
    res$content
  }
  else {
    NA
  }
}

#' Returns time-series of historical values data-point tag for a index over specified time range
#'
#'  Stock Market Indices: "$SPX"   "$DJI"   "$DJA"   "$TRAN"  "$UTIL"  "$NDX"   "$COMPQ"
#'
#' @param identifier {String} A Index identifier (symbol, Intrinio ID)
#' @param tag {String} An Intrinio data tag ID or code (defaults to `level``)
#' @param opts {named list} Optional query params for endpoint
#' @param opts$start_date {Date} YYYY-MM-DD Return prices on or after the date
#' @param opts$end_date {Date} YYYY-MM-DD Return prices on or before the date
#' @param opts$sort_order {String = "desc"} desc | asc
#' @param opts$page_size {number = 100} The number of results to return per page
#' @family security endpoints
#' @seealso \url{https://data.intrinio.com/data-tags}
#' @export
getIndicesDataPointHistory <- function(identifier,tag = "level", type = "stock_market", opts=list(), rm.na = TRUE) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/indices/{type}/{identifier}/historical_data/{tag}")
  endpoint$query <- opts
  res <- intrino_fetch(endpoint)
  if (!res$status){
    symbol <- res$content$index$symbol[[1]];
    name <- res$content$index$name[[1]];
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
    df <- df %>% tibble::add_column(name = name, .before = 1)
    df <- df %>% tibble::add_column(symbol = symbol, .before = 1)
    if (rm.na) {
      df <- dplyr::filter(df, !is.na(value))
    }
    df <- df %>% dplyr::rename(!!tag := value)
  } else {
    df <- tibble::as_tibble(list())
  }
  return (df)
}
