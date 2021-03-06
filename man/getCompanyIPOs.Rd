% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/company.service.R
\name{getCompanyIPOs}
\alias{getCompanyIPOs}
\title{Returns initial public offerings (IPOs). An IPO is a public offering of private company stock. The act of &quot;going public&quot; is initiated by an IPO, at which point the company's stock trades on a major stock exchange (such as NYSE or NASDAQ). Intrinio covers all upcoming and recent IPOs for US exchanges.}
\usage{
getCompanyIPOs(opts = list())
}
\arguments{
\item{opts}{{named list}  Optional parameters}

\item{opts$ticker}{{String}  Return IPOs with the given ticker (typically the IPO for the company)}

\item{opts$status}{{String}  upcoming | priced | withdrwn Return IPOs with the given status. Upcoming IPOs are scheduled to occur in the future. Priced IPOs have occured and the company should be trading publicly. Withdrawn IPOs were planned to occurr but were withdrawn beforehand}

\item{opts$start_date}{{Date}  Return IPOs on or after the given date}

\item{opts$end_date}{{Date}  Return IPOs on or before the given date}

\item{opts$offer_amount_greater_than}{{Number}  Return IPOs with an offer dollar amount greater than the given amount}

\item{opts$offer_amount_less_than}{{Number}  Return IPOs with an offer dollar amount less than the given amount}

\item{opts$page_ize}{{Number}  The number of results to return (default to 100)}
}
\value{
ipos {tibble}
}
\description{
Note: sandbox has no data for this endpoint
}
\seealso{
Other company endpoints: \code{\link{getAllCompanies}},
  \code{\link{getCompanyDataPointHistory}},
  \code{\link{getCompanyDataPointNumber}},
  \code{\link{getCompanyDataPointText}},
  \code{\link{getCompanyFilings}},
  \code{\link{getCompanyFundamentals}},
  \code{\link{getCompanyNews}},
  \code{\link{getCompanySecurities}},
  \code{\link{getCompany}}
}
\concept{company endpoints}
