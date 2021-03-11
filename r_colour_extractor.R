#Run this to install package if needed
#install.packages("jpeg")

#call the librarys needed
library(jpeg)
library(reshape2)

#upload a photo
#var_1 <- readJPEG("var_1.jpg")

#show all files in working directory, stored as a vector
#WD must be same as file where code is stored
#put code in same file as photos 
#photos must be as .jpg
files <- list.files(path = "./",
                    pattern = "*jpg",
                    full.names = TRUE,
                    recursive = FALSE)

#take the center 200 pixels of the image 
center_col <- round(1/2*ncol(var_1))
center_row <- round(1/2*nrow(var_1))
col_min <- center_col - 100; col_max <- center_col + 100
row_min <- center_row - 100; row_max <- center_row + 100
  
R <- data.frame(var_1[col_min:col_max, row_min:row_max, 1])
G <- data.frame(var_1[col_min:col_max, row_min:row_max, 2])
B <- data.frame(var_1[col_min:col_max, row_min:row_max, 3])

#output for R G B are data.frames that show values at each point
#black RBG = (0,0,0)

#melt the dataframes into one column (ignore errors)
R_melted <- melt(R)
G_melted <- melt(G)
B_melted <- melt(B)

#remove R values less than 0.1 (too dark) or >= 0.9 (too light)
R_cleansed <- vector()
for (i in 1:length(R_melted$value)) {
  if (R_melted$value[i] >= 0.1 || R_melted$value[i] <= 0.9) {
    R_cleansed[i] <- R_melted$value[i]
  }
}

#remove G values less than 0.1 (too dark) or >= 0.9 (too light)
G_cleansed <- vector()
for (i in 1:length(G_melted$value)) {
  if (G_melted$value[i] >= 0.1 || G_melted$value[i] <= 0.9) {
    G_cleansed[i] <- G_melted$value[i]
  }
}

#remove B values less than 0.1 (too dark) or >= 0.9 (too light)
B_cleansed <- vector()
for (i in 1:length(B_melted$value)) {
  if (B_melted$value[i] >= 0.1 || B_melted$value[i] <= 0.9) {
    B_cleansed[i] <- B_melted$value[i]
  }
}

summary(R_cleansed, G_cleansed, B_cleansed)
boxplot(R_cleansed, G_cleansed, B_cleansed)

#write csv
write.csv((melt(R)), "var_1_R_melt_full.csv")

