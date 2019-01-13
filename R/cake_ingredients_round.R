cake_ingredients_round <- function(d,h,type) {

  require(stringr)
  require(tidyr)
  require(dplyr)
  require(tibble)

  d_range <- 6:12
  h_range <- seq(3,4,.25)
  type <- str_to_lower(gsub(' ','_',type))

  if (d %in% d_range & h %in% h_range & type %in% c('red_velvet','chocolate','vanilla')) {

  round_ingredients <- gs_quickread('cake_recipes_round') %>%
	filter(cake_name == type)

  c <- round_ingredients %>%
    distinct(volume)

  core_volume <- c[['volume']]

  new_volume <- pi * (d/2)^2 * h

  mult <- new_volume / core_volume

  new_recipe <- round_ingredients %>%
    mutate(diameter = d,
           height = h,
           volume = new_volume,
           amount = round(amount * mult,digits=0),
		   price = round(amount * price_per_unit,digits=2)) %>%
	select(cake_name,ingredient,amount,unit,price)

  return(new_recipe) } else {
	print('Bad input! Please check your input values')
    break
  }

}
