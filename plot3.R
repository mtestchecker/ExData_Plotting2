library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

data <- subset(NEI, fips=="24510")
data <- aggregate(Emissions ~ year + type, data, sum)


ggplot(data, aes(year, Emissions, color=type)) + 
  geom_line() + 
  ggtitle("Total emissions in the Baltimore City for type") + 
  ylab("Total PM2.5 emission") + 
  xlab("Year") 

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()
