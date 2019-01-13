vol_calcs <- function(x,type) {

z <- x[[4]]

if (type == 'round') {

	volume <- pi * (z$d/2)^2 * z$h

} else {

	volume <- z$l * z$w * z$h

}

return(volume)

}