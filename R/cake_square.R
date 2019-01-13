cake_square <- function(l,w,h,filling,fondant,type) {

	require(dplyr)
	require(googlesheets)
	require(tidyr)
	require(stringr)
	require(tibble)
	
	ingredients <- cake_ingredients_square(l,w,h,type)
	
	filling <- cake_filling_square(l,w,h,filling) 
	
	fondant <- cake_fondant_square(l,w,h,fondant)
	
	dimensions <- tibble(l = l, w = w, h = h)
	
	cake_list <- list(ingredients,filling,fondant,dimensions)
	
	return(cake_list)

}