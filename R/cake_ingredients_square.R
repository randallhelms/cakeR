cake_ingredients_square <- function(l,w,h,type) {
  
  require(stringr)
  require(tidyr)
  require(dplyr)
  require(tibble)
  
  l_range <- 6:12
  w_range <- 6:12
  h_range <- seq(3,4,.25)
  
  if (type %in% c('red_velvet','chocolate','vanilla')) {
      
  square_ingredients <- gs_quickread('cake_recipes_square') %>%
	filter(cake_name == type)
  
  c <- square_ingredients %>%
    distinct(volume)
  
  core_volume <- c[['volume']]
  
  new_volume <- l * w * h
  
  mult <- new_volume / core_volume
  
  new_recipe <- square_ingredients %>%
    mutate(length = l,
		   width = w,
           height = h,
           volume = new_volume,
           amount = round(amount * mult,digits=0),
		   price = round(amount * price_per_unit,digits=2)) %>%
	select(cake_name,ingredient,amount,unit,price)
  
  return(new_recipe) } else {
	stop('Bad input! Please check your input values')

  }
  
}