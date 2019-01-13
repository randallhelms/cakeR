ingredient_calcs <- function(x) {

	z <- x %>%
        inner_join(price_list,by='ingredient') %>%
        mutate(price = round(price_per_unit * amount,digits=2)) %>%
        select(ingredient,price,unit)
		  
	return(z)
}