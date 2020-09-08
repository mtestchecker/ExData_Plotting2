NEI <- readRDS("summarySCC_PM25.rds")

data <- subset(NEI, fips=="24510" & type=="ON-ROAD")
data <- with(data, {
  aggregate(Emissions, by=list(year), FUN=sum)
})

plot(data, type="l",
     xlab="Year", 
     ylab="Total PM2.5 emission",
     main="Total emissions from motor vehicle sources in Baltimore City")

dev.copy(png, file="plot5.png", height=480, width=480)

dev.off()
