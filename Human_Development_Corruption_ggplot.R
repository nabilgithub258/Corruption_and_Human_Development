library(ggplot2movies)
library(ggplot2)
library(ggthemes)
library(plotly)

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

df <- read_csv('Economist_Assignment_Data.csv')

pl <- ggplot(df,aes(x=CPI,y=HDI,color=Region)) + geom_point(size=4,shape=1)

pl2 <- pl + geom_smooth(aes(group = 1), method ='lm',formula = y ~ log(x),color='red',se=FALSE)

pl3 <- pl2 + geom_text(aes(label = Country),color='grey20',data=subset(df,Country %in% pointsToLabel),check_overlap = TRUE)

pl4 <- pl3 + theme_economist_white()

pl5 <- pl4 + xlab('Corruption Perception Index') + ylab('Human Development Index') + ggtitle('Corruption and Human Development')

print(pl5)
