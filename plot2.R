NEI <- readRDS("summarySCC_PM25.rds")

data <- subset(NEI, fips=="24510")
data <- with(data, {
  aggregate(Emissions, by=list(year), FUN=sum)
})

plot(data, type="l",
     xlab="Year", 
     ylab="Total PM2.5 emission",
     main="Total emissions in the Baltimore City")

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
