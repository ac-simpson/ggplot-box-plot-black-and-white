#create nice boxplot of nutrient levels instead of those stupid columns

##open spreadsheet
df <- read.csv("/Users/Petrichor/Dropbox/Soils Pools and FLuxes paper/Spreadsheets/moisturecorrectedresults2014.csv", header=TRUE)

##reorder factor
df$Visit <- factor(df$Visit, levels = c("Summer", "Fall"))

##Load ggplot 2
library(ggplot2)
library(grid)
library(dplyr)
library(lubridate)

p <- ggplot(df, aes(factor(Site), microN))
p2 <- ggplot(df, aes(factor(Site), microC))


##first plot includes language about legend position!!! get rid of the legend in subsequent plots...
plot1 <- p + 
  geom_boxplot(aes(fill = factor(Visit))) + 
  scale_x_discrete(name = "Site") + 
  scale_y_continuous(name = "Microbial N") + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"), 
        axis.text=element_text(size=12), 
        axis.title=element_text(size=14,face="bold"), 
        legend.justification=c(0,1), 
        legend.position=c(0.01,1),
        legend.title=element_blank(),
        legend.key=element_blank(),
        legend.text=element_text(size=12)) +
  scale_fill_grey(start = 0, end = .9)

  
plot2 <- p2 + 
  geom_boxplot(aes(fill = factor(Visit))) + 
  scale_x_discrete(name = "Site") + 
  scale_y_continuous(name = "Microbial C") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"), 
        axis.text=element_text(size=12), 
        axis.title=element_text(size=14,face="bold"),
        legend.position = "none") + 
  scale_fill_grey(start = 0, end = .9)

grid.newpage()
grid.draw(cbind(ggplotGrob(plot1), ggplotGrob(plot2), size = "last"))



