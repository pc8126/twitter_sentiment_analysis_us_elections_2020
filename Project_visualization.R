library(usmap)
library(ggplot2)

data <- read.csv('C:/Users/jocel/OneDrive/2020_3_Fall/MIS 284N - Text Analysis/summary_sentiment.csv')
names(data)[names(data)=="state_new"] <- "state"

data['scaled_diff'] <- scale(data['sentiment_diff'])
mean(data$scaled_diff, na.rm = TRUE)

battleground_data = subset(data, state_type=='battleground')
#battleground_data['scaled_diff'] <- scale(battleground_data['sentiment_diff'])

par(bg=NA)
plot_usmap(data=battleground_data, values = 'sentiment_diff', color = 'white') +
  scale_fill_continuous(low = 'white', high = 'blue', name = "Sentiment Different", label = scales::comma) +
  theme(legend.position = 'right', panel.background = element_rect(fill = "transparent"))

dev.copy(png,'myplot.png')
dev.off()
par(bg=NA)
dev.off()
