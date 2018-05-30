

```R
# Let's start by installing and loading all the libraries that we are going to use

install.packages("gplots", dependencies = TRUE)
library(gplots)

data <- read.delim("directory")

rnames <- data[,1]                            # assign labels in column 1 to "rnames"
mat_data <- data.matrix(data[,2:ncol(data)])  # transform column 2-5 into a matrix
rownames(mat_data) <- rnames                  # assign row names

# creates a own color palette from red to green
my_palette <- colorRampPalette(c("navy","white", "red"))

# creates a 5 x 5 inch image
png ("",    # create PNG for the heat map        
   width = 7*500,        # 5 x 300 pixels
    height = 7*300,
    res = 300,            # 300 pixels per inch
    pointsize = 10)        # smaller font size

heatmap.2(mat_data,
          #cellnote = mat_data,  # same data set for cell labels
          main = "Correlation", # heat map title
          notecol="black",      # change font color of cell labels to black
          density.info="none",  # turns off density plot inside color legend
          trace="none",         # turns off trace lines inside the heat map
          margins =c(19,19),     # widens margins around plot
          col=my_palette,       # use on color palette defined earlier
          #breaks=col_breaks,    # enable color transition at specified limits
          dendrogram="none",     # only draw a row dendrogram
          Colv="NA")            # turn off column clustering
          
```
