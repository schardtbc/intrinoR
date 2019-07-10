

#' Returns the Filing meta data for the given `id`
#' @param id {String}  The Intrinio ID for the Filing
#' @family filing endpoints
#' @export
getFilingById <- function(id) {
  endpoint <- list()
  class(endpoint)<- "url"
  endpoint$path <- glue::glue("/filings/{id}")
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
