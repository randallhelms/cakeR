library(cakeR)
library(rmarkdown)

d <- 7 #input your diameter
h <- 4.25 #input your height
filling <- 'ganache' #input the type of filling
fondant <- 'color' #input which type of fondant
type <- 'chocolate' #input the type of cake
board_color <- 'white'
deco_minutes <- 120 #time to decorate the cake
customer_name <- str_replace(str_to_lower('Randall Helms'),' ','_')

cake <- cake_round(d,h,filling,fondant,type)

board <- cake_boards(cake,'round',board_color)
box <- cake_boxes(board)
work <- labor_cost(deco_minutes)

template <- 'C:/Users/Randall Helms/Documents/R/cakeR/cake_quote3.Rmd'

file_name <- paste(Sys.Date(),'_quote_',customer_name,'.html',sep='')

render(template,output_format = 'html_document',
       output_file=file_name,output_dir="C:/Users/Randall Helms/Documents/R/cakeR")

