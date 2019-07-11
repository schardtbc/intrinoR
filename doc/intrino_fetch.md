### `intrino_fetch`
***
***

### Description

 Perform a get request to an endpoint on the intrino server

### Usage
```r
intrino_fetch(endpoint, next_page = NULL)
```

### Arguments
Argument      |Description
------------- |----------------
```endpoint```     |     a "url" object or a character string which will form the variable part of the endpoint URL for a discussion of url objects see httr::build_url
### Value

 a list, class iex_api, with keys of "status,content,url,response

