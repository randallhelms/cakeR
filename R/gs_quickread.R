gs_quickread <- function(name,worksheet=1) {

  require(googlesheets)
  require(tidyverse)

  xlist <- gs_ls() %>%
    filter(sheet_title == name)
	
  if (nrow(xlist) > 1) {
  
  xlist <- xlist %>%
	arrange(desc(updated)) %>%
	slice(1)
	
}

  key <- xlist[['sheet_key']]

  gkey <- gs_key(key)

  x <- gs_read(gkey,ws=worksheet,literal=TRUE)

  return(x)

}