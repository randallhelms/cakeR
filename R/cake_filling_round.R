cake_filling_round <- function(d,h,filling) {

  require(stringr)
  require(tidyr)
  require(dplyr)
  require(tibble)

  d_range <- 6:12
  h_range <- seq(3,4,.25)

  price_list <- tibble(ingredient = c('icing_sugar','butter','double_cream','chocolate','rum'),
                       units = c(250,250,200,2500,700),
                       price = c(.49,1.75,.65,21.9,13.49),
                       price_per_unit = price / units
  )
  
  filling <- str_to_lower(gsub(' ','_',filling))
  
  possibles <- c('ganache','buttercream','chocolate_buttercream','coconut_rum_buttercream','vanilla_buttercream')

  filling <- str_to_lower(ifelse(filling %in% c('chocolate ganache','chocolate'),'ganache',filling))

  mult <- 5.5

  vol <- pi * (d/2)^2 * h
  surf_area <- (2 * pi * (d/2) * h) + (2 * pi * (d/2)^2)
  
  if(filling %in% possibles) {

    if (filling=='buttercream') {

      buttercream <- round(mult*surf_area,-1)
      icing_sugar <- round(buttercream * (2/3),-1)
      butter <- icing_sugar/2

      butter_calcs <- tibble(ingredient = c('buttercream','icing_sugar','butter'),
                             amount = c(buttercream,icing_sugar,butter))

      butter_prices <- butter_calcs %>%
        inner_join(price_list,by='ingredient') %>%
        mutate(price = round(price_per_unit * amount,digits=2)) %>%
        select(ingredient,price)

      butter_sum <- sum(butter_prices$price)

      butter_prices <- butter_prices %>%
        add_row(ingredient = 'buttercream',price=butter_sum)

      butter_calcs <- butter_calcs %>%
        inner_join(butter_prices,by='ingredient') %>%
		    mutate(unit = 'g') %>%
		    select(ingredient,amount,unit,price)

      return(butter_calcs) } else {

        ganache <- round(mult * surf_area,-1)
        chocolate <- round((ganache / 2) * 1.1,-.5)
        double_cream <- chocolate

        ganache_calcs <- tibble(ingredient = c('ganache','chocolate','double_cream'),
                                amount = c(ganache,chocolate,double_cream),
								unit = c('g','g','ml')
								)

        ganache_prices <- ganache_calcs %>%
          inner_join(price_list,by='ingredient') %>%
          mutate(price = round(price_per_unit * amount,digits=2)) %>%
          select(ingredient,price,unit)

        ganache_sum <- sum(ganache_prices$price)

        ganache_prices <- ganache_prices %>%
          add_row(ingredient = 'ganache',price=ganache_sum) %>%
		  select(ingredient,price)

        ganache_calcs <- ganache_calcs %>%
          inner_join(ganache_prices,by='ingredient')

        return(ganache_calcs)

      }
  } else {
    stop('Error: Bad input! Please try again')

  }
}
