labor_cost <- function(deco_time) {

#decorating is a variable, and can change 

 tbl <- tibble(task = c('cooking','decorating','prep','shopping'),
			   time_process = c(60,deco_time,30,15),
			   value = c(3.75,(deco_time / 60)*10.5,3.75,(3.75/2))
			   )
			   
labor_total <- sum(tbl$value)

return(labor_total) 
 
 }