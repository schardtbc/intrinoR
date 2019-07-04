#' return first argument that is not null
#' @keywords internal
#' @export
coalesce <- function(a,b,...) {
  if (!is.null(a)){
    return(a)
  }
  if (missing(b)){
    return (NULL)
  }
  coalesce(b,...)
}


addToken <- function(endpoint){
  key <- getApiKey();
  if (!is.null(key)) {
    result <- ifelse(stringr::str_detect(endpoint,stringr::fixed("?")),
                     paste0(endpoint, "&api_key=", key),
                     paste0(endpoint, "?api_key=", key)
    )
  } else {
    stop("missing INTRINO API KEY value")
  }
  return (result)
};

#' construct the url for the api get request
#' @keywords internal
#' @export
prefix <- function() {
  getConfig()$baseURL
}

#' construct the url for the api get request
#' @keywords internal
#' @export
constructURL <- function(endpoint, next_page = NULL) {
  if (is(endpoint,"url")){
    endpoint$hostname <- gsub("https://","",prefix());
    endpoint$scheme <- "https"
    endpoint$query$next_page <- next_page
    endpoint$query$api_key <- getApiKey();
    httr::build_url(endpoint)
  } else {
    paste0(prefix(),addToken(endpoint))
  }
}


#' Perform a get request to an endpoint on the intrino server
#'
#' @param endpoint a "url" object or a character string which will form the variable part of the endpoint URL
#'    for a discussion of url objects see httr::build_url
#' @return a list, class iex_api, with keys of "status,content,url,response
#' @export
intrino_fetch <- function(endpoint, next_page = NULL) {
  url <- constructURL(endpoint, next_page);
  resp <- httr::GET(url);
  parsed <- list()
  if (httr::http_error(resp)) {
    warning(
      sprintf(
        "INTRINO API request failed [%s]\n%s\n%s\n%s",
        httr::status_code(resp),
        httr::content(resp)$message,
        "url requested:",
        resp$url
      ),
      call. = FALSE
    )
  } else {

    if (httr::http_type(resp) != "application/json") {
      warning(
        sprintf(
          "INTRINO API did not return json\n%s",
          httr::content(resp, "text")
        ),
        call. = FALSE
      );
      parsed <- list();
    } else {
      parsed <- jsonlite::fromJSON(httr::content(resp, "text", encoding = "UTF-8"), simplifyVector = FALSE)
    }
  }

  structure(
    list(
      status = httr::http_error(resp),
      content = parsed,
      endpoint = endpoint,
      response = resp
    ),
    class = "intrino_api"
  )

};


#' print S3 function for intrino_api class
#' @keywords internal
#' @export
print.intrino_api <- function(x, ...){
  endpoint <- x$response$url
  endpoint <- gsub(prefix(),"",endpoint)
  endpoint <- gsub(getApiKey(),"",endpoint)
  endpoint <- gsub("[&?]api_key=","",endpoint)
  cat("<INTRINO ", endpoint, " >\n", sep = "")
  if (x$status) {
    cat(sprintf(
      "INTRINO API request failed [%s]\n%s",
      httr::status_code(x$response$status_code),
      httr::content(x$response)$message
    ))
  } else {
    str(x$content)
  }
  invisible(x)
}
