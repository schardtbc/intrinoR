% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/security.service.R
\name{getSecurityZacksAnalystRatingsSnapshot}
\alias{getSecurityZacksAnalystRatingsSnapshot}
\title{Returns a snapshot of ratings data compared with previous timeframes for the Security with the given \code{identifier}.}
\usage{
getSecurityZacksAnalystRatingsSnapshot(identifier, opts = list())
}
\arguments{
\item{identifier}{{String} A Security identifier (Ticker, FIGI, ISIN, CUSIP, Intrinio ID)}

\item{opts}{{named list} Optional. queryParms}

\item{opts$date}{{String} YYYY-MM-DD Lookup a historical snapshot on the given date}
}
\value{
{tibble}
}
\description{
Also returns mean percentiles for comparing one security to the universe of securities
covered by Zacks analyst ratings, at a specific point in time.
}
\seealso{
Other security endpoints: \code{\link{getAllSecurities}},
  \code{\link{getIndicesDataPointHistory}},
  \code{\link{getSecurityById}},
  \code{\link{getSecurityDataPointHistory}},
  \code{\link{getSecurityDataPointNumber}},
  \code{\link{getSecurityDataPointText}},
  \code{\link{getSecurityDividendsLatest}},
  \code{\link{getSecurityEarningsLatest}},
  \code{\link{getSecurityIntradayPrices}},
  \code{\link{getSecurityRealtimePrice}},
  \code{\link{getSecurityStockPrices}}
}
\concept{security endpoints}
