model <- kmeans(ANSWERS[, -1], 2)
ANSWERS_CLUST <- ANSWERS
ANSWERS_CLUST$cluster <- model$cluster
devtools::install_github("ricardo-bion/ggradar", dependencies = TRUE)
library(ggradar)
names(ANSWERS)[1] <- "GROUP"
names(ANSWERS_CLUST)[1] <- "GROUP"

ANSWERS_RADAR <- ANSWERS %>% mutate_at(vars(-GROUP), function(x) {(x + 1)/2}) 
ggradar(ANSWERS_RADAR)

model_pca <- prcomp(ANSWERS_RADAR[,-c(1, 8, 21)])
summary(model_pca)
library(devtools)
install_github("vqv/ggbiplot")
library(ggbiplot)
biplt<- ggbiplot(model_pca, labels = ANSWERS$GROUP, choices = c(1,2))
model_pca$rotation %>% round(., 4)
# PC1 : +8, +11, -13, +14, +16, -17,
# PC2: -1, -3, -6, -18
# PC3: -9, -15, -19
ANSWERS_CLUST$PC1 <- apply(ANSWERS[,-1], 1, function(x) {sum(x[-c(7, 20)] * model_pca$rotation[,1])})
ANSWERS_CLUST$PC2 <- apply(ANSWERS[,-1], 1, function(x) {sum(x[-c(7, 20)] * model_pca$rotation[,2])})
ANSWERS_CLUST$PC3 <- apply(ANSWERS[,-1], 1, function(x) {sum(x[-c(7, 20)] * model_pca$rotation[,3])})

library(plotly)
ggplotly(biplt)

p <- plot_ly(ANSWERS_CLUST, x = ~PC1, y = ~PC2, z = ~PC3, color = ~GROUP,
             colors = c('#cfa61f', '#2b2929', '#ff231f', '#030e40', '#0bd00b')) %>% 
  add_markers()
