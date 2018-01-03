# We have found from the python script and previous Eclat algorithm, our maximum clique 
# given our support of 0.5, What are now the quantitative attributes of this set? How do they differ?
data <-read.csv("~/Documents/Aeropress16/Coffee_17.csv",sep=";",header=T,row.names="Recipe")

# From our set: 
# {'Lazar Alexandru Gabriel', 'Klas Rehn', 'Daniel Roque', 
# 'Winston Thomas', 'Grant Studer', 'Theo Garcia', 'Vaios Kandilas', 'Matt Randell', 'Baris Iscan'}

sub_data <- data[c('Lazar Alexandru Gabriel', 'Klas Rehn', 'Daniel Roque', 'Winston Thomas', 'Grant Studer', 'Theo Garcia', 'Vaios Kandilas', 'Matt Randell', 'Baris Iscan'),]
Z <- scale(sub_data[,c("Weight","Grind","Water","Temperature")])
# Test the mean, std deviation. If std deviation is low, then very similar recipes. What else differs?

# BOX PLOT
boxplot(Z[,1],Z[,2],Z[,3],Z[,4], data = Z,
       xlab = "Weight, Grind, Water, Temperature", ylab = "Normalised Y",
       main = "Changes in Quantitative Settings"
)
