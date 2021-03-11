#Run this to install package if needed
#install.packages("jpeg")

library(jpeg)

#upload a photo
var_1 <- readJPEG("var_1.jpg")


  
#call the library
library(jpeg)
  
#take the center 200 pixels of the image 
center_col <- round(1/2*ncol(var_1))
center_row <- round(1/2*nrow(var_1))
col_min <- center_col-100; col_max <- center_col+100
row_min <- center_row-100; row_max <- center_row+100
  
R <- data.frame(var_1[col_min:col_max, row_min:row_max, 1])
G <- data.frame(var_1[col_min:col_max, row_min:row_max, 2])
B <- data.frame(var_1[col_min:col_max, row_min:row_max, 3])
  



