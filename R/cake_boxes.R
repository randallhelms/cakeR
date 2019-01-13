cake_boxes <- function(board) {

boxes <- gs_quickread('Sweet Time Berlin Tracking','boxes') %>%
	tidycols()

board_dims <- board$size_cm

boxes <- boxes %>%
	filter(length_cm > board_dims) %>%
	arrange(length_cm)
	
box_size <- boxes[1,]

return(box_size)

}
