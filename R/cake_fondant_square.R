cake_fondant_square <- function(l,w,h,fondant) {
  
  require(stringr)
  require(tidyr)
  require(dplyr)
  require(tibble)
  
  l_range <- 6:12
  w_range <- 6:12
  h_range <- seq(3,4,.25)
  
  price_list <- tibble(ingredient = c('fondant_white','fondant_color'),
                       amount = c(5000,1000),
                       price = c(33.9,10.9),
                       price_per_unit = price / amount
  )
	
  fondant <- str_to_lower(ifelse(fondant %in% c('colored','colour','coloured'),'color',fondant))
  
  if (fondant %in% c('white','color')) {

  surf_area <- 2 * ((l*w)+(w*h)+(l*h))
  
  fond_mult <- 3.1
  end_fondant <- round(fond_mult * surf_area,-1)
  start_fondant <- end_fondant * 1.5
  
  fprice <- ifelse(fondant=='white',price_list$price_per_unit[[1]],
                   price_list$price_per_unit[[2]])
  
  fondant_table <- tibble(variable=c('start_fondant','end_fondant'),
                    value=c(start_fondant,end_fondant),
                    price=fprice*value
  )
  
  return(fondant_table)
  } else {
  stop('Error! Please check your inputs')
 }
}