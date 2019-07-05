config <- new.env(parent = emptyenv())

#' returns package configuration
#' @export
getConfig <- function(){
  config
}

#' set the INTRINO API key
#' @param token INTRINO API key
#' @export
setProductionKey <- function(key){
  config$productionKey <- key;
}

#' retrieve the INTRINO API key
#' @export
getApiKey <- function(){
  ifelse(config$production,config$productionKey,config$sandboxKey);
}

#' set the INTRINO Sandbox Key
#' @param sandboxKey INTRINO sandbox key
#' @export
setSandboxKey <- function(snadboxKey){
  config$sandboxKey <- sandboxKey;
}

#' retrieve the INTRINO API key
#' @export
getSandboxKey <- function(){
  config$sandboxKey;
}

#' Use the intrino sandbox server
#'
#' When the api calls are directed to the sandbox server there are a limited number of symbols, which return data.
#' These include the dow30, "AAPL", etc.
#'
#' Accessing the production data requires a paid subscription
#' @seealso \url{https://product.intrinio.com/marketplace/financial-data?category=all&geography=all}
#'
#' @export
useSandbox <- function() {
  config$production <- FALSE
}

#' use the intrino production server
#'
#' When the api calls are directed to the sandbox server there are a limited number of symbols, which return data.
#' These include the dow30, "AAPL", etc.
#'
#' Accessing the production data requires a paid subscription
#' @seealso \url{https://product.intrinio.com/marketplace/financial-data?category=all&geography=all}
#'
#' @export
useProduction <- function(){
  config$production <- TRUE
}

.onLoad <- function(libname, pkgname) {
  if (file.exists(".env")){
    readRenviron(".env");
  }

  env<-Sys.getenv();
  INTRINO <- as.list(env[grep("^INTRINO",names(env))]);
  config$baseURL <- coalesce(INTRINO$INTRINO_BASE_URL,"https://api-v2.intrinio.com");
  production_key = INTRINO$INTRINO_PRODUCTION_KEY;
  if (is.null(production_key)) {
    warning('INTRINO_PRODUCTION_KEY must be provided in environment file to access INTRINO API')
  }
  sandbox_key = INTRINO$INTRINO_SANDBOX_KEY;
  if (is.null(sandbox_key)){
    warning('INTRINO_SANDBOX_KEY must be must be provided in environment file to access INTRINO API')
  }
  config$productionKey <- production_key
  config$sandboxKey <- sandbox_key
  config$production <- FALSE
  invisible(config)
}
