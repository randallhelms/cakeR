cake_fondant_round <- function(d,h,fondant) {

  require(stringr)
  require(tidyr)
  require(dplyr)
  require(tibble)
  
  d_range <- 6:12
  h_range <- seq(3,4,.25)
  
  price_list <- tibble(ingredient = c('fondant_white','fondant_color'),
                       amount = c(5000,1000),
                       price = c(33.9,10.9),
                       price_per_unit = price / amount
  )
	fondant <- str_to_lower(ifelse(fondant %in% c('colored','colour','coloured'),'color',fondant))
  
  if (fondant %in% c('white','color')) {
  
  vol <- pi * (d/2)^2 * h
  surf_area <- (2 * pi * (d/2) * h) + (2 * pi * (d/2)^2)
  
  fond_mult <- 3.1
  end_fondant <- round(fond_mult * surf_area,-1)
  start_fondant <- end_fondant * 1.5
  
  fprice <- ifelse(fondant=='white',price_list$price_per_unit[[1]],
                   price_list$price_per_unit[[2]])
  
  fondant_table <- tibble(ingredient=c('start_fondant','end_fondant'),
                    amount=c(start_fondant,end_fondant),
					unit = 'g',
                    price=round(fprice*amount,digits=2)
  )
  
  return(fondant_table) }
  else {
  stop('Error! Please check your inputs')

  }

}