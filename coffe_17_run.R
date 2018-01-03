library("FactoMineR")
library("factoextra")
library(GGally)
library(network)
library(sna)
library(ggplot2)

DF$Grind <- as.character(DF$Grind)
res.famd <- FAMD(DF, graph = FALSE)
eig.val <- get_eigenvalue(res.famd)
head(eig.val)
fviz_screeplot(res.famd)

var <- get_famd_var(res.famd)
var
head(var$coord)
head(var$cos2)
head(var$contrib)
# Plot of variables
fviz_famd_var(res.pca, repel = TRUE)
# Contribution to the first dimension
fviz_contrib(res.pca, "var", axes = 1)
# Contribution to the second dimension
fviz_contrib(res.pca, "var", axes = 2)

quanti.var <- get_famd_var(res.famd, "quanti.var")
quanti.var 

fviz_famd_var(res.famd, "quanti.var", repel = TRUE,
              col.var = "black")

fviz_famd_var(res.famd, "quali.var", col.var = "contrib", 
              gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
              
              
)


ind <- get_famd_ind(res.famd)
ind
fviz_famd_ind(res.famd, col.ind = "cos2", 
              gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
              repel = TRUE)
fviz_mfa_ind(res.famd, 
             habillage = "Preparation", # color by groups 
             palette = c("#00AFBB", "#E7B800", "#FC4E07"),
             addEllipses = TRUE, ellipse.type = "confidence", 
             repel = TRUE # Avoid text overlapping
) 

fviz_ellipses(res.pca, c("Recipe", "Preparation"), repel = TRUE)
fviz_ellipses(res.famd,8, geom = "point")

HCPC(res.famd, nb.clust = 0, min = 3, max = NULL, graph = TRUE)


res.pca <- PCA(DF[,c(4,6,7,9)], ncp = 3, graph = FALSE)
res.hcpc <- HCPC(res.pca, graph=FALSE)
fviz_dend(res.hcpc, geom = "point")


## Mine itemsets with tidLists.
f <- eclat(transaction_4, parameter = list(support = 0.5, tidLists = TRUE))

## Get dimensions of the tidLists.
dim(tidLists(f))

## Coerce tidLists to list.
as(tidLists(f), "list")

## Inspect visually.
image(tidLists(f))

##Show the Frequent itemsets and respectives supports
inspect(f)
