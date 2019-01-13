cake_boards <- function(cake,cake_type,color,how_thick=3) {

boards <- gs_quickread('Sweet Time Berlin Tracking','sundries stock') %>%
	tidycols() %>%
	filter(board_type == cake_type)

if (cake_type == 'round') {

cake_dims <- cake[[4]]$d 

} else {

cake_dims <- cake[[4]]$l

}

cake_dims_cm <- cake_dims * 2.54

board_dims <- cake_dims + 3

boards_dim <- boards %>%
	filter(size_inches == board_dims & board_color == color & thickness == how_thick)
	
#check for stock

if (boards_dim$stock == 0) {
  
  boards_dim <- boards %>%
    filter(size_inches == board_dims & thickness == how_thick) %>%
    filter(stock > 0)
  
  if (nrow(boards_dim) == 0) {
    
    boards_dim <- boards %>%
      filter(size_inches == board_dims) %>%
      filter(stock > 0)
    
    if (nrow(boards_dim) == 0) {
      
      new_size <- board_dims + 1
      
      boards_dim <- boards %>%
        filter(size_inches == new_size & board_color == color & thickness == how_thick)
      
      if (boards_dim$stock == 0) {
        
        nboards_dim <- boards %>%
          filter(size_inches == new_size & thickness == how_thick) %>%
          filter(stock > 0)
        
      }
    }
    
  } 
  
}
	
return(boards_dim)

}