NEI <- readRDS("summarySCC_PM25.rds")

data <- subset(NEI, (fips=="24510" | fips=="06037") & type=="ON-ROAD")

#data <- with(data, {
#  aggregate(Emissions, by=list(fips, year), FUN=sum)
#})

#plot(data, type="l",
#     xlab="Year", 
#     ylab="Total PM2.5 emission",
#     main="Compare emissions from motor vehicle sources: Baltimore City vs Los Angeles County")

data <- aggregate(Emissions ~ year + fips, data, sum)

library(ggplot2)
ggplot(data, aes(year, Emissions, color=fips)) + 
  geom_line() + 
  ggtitle("Compare emissions from motor vehicle sources: Baltimore City vs Los Angeles County") + 
  ylab("Total PM2.5 emission") + 
  xlab("Year") 

dev.copy(png, file="plot6.png", height=480, width=480)

dev.off()
