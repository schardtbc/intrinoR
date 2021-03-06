% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/security.service.R
\name{getSecurityById}
\alias{getSecurityById}
\title{Returns the Security with the given `identifier`}
\usage{
getSecurityById(identifier)
}
\arguments{
\item{identifier}{{String} A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)}
}
\value{
df {tibble}
}
\description{
Returns the Security with the given `identifier`
}
\seealso{
Other security endpoints: \code{\link{getAllSecurities}},
  \code{\link{getIndicesDataPointHistory}},
  \code{\link{getSecurityDataPointHistory}},
  \code{\link{getSecurityDataPointNumber}},
  \code{\link{getSecurityDataPointText}},
  \code{\link{getSecurityDividendsLatest}},
  \code{\link{getSecurityEarningsLatest}},
  \code{\link{getSecurityIntradayPrices}},
  \code{\link{getSecurityRealtimePrice}},
  \code{\link{getSecurityStockPrices}},
  \code{\link{getSecurityZacksAnalystRatingsSnapshot}}
}
\concept{security endpoints}
