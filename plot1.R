NEI <- readRDS("summarySCC_PM25.rds")

data <- with(NEI, {
  aggregate(Emissions, by=list(year), FUN=sum)
})

plot(data, type="l",
     xlab="Year", 
     ylab="Total PM2.5 emission",
     main="Total emissions in the United States")

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()
