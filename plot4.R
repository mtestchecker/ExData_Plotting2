NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- SCC[grepl("Coal", SCC$Short.Name), ]
data <- NEI[NEI$SCC %in% coal$SCC, ]
data <- with(data, {
  aggregate(Emissions, by=list(year), FUN=sum)
})

plot(data, type="l",
     xlab="Year", 
     ylab="Total PM2.5 emission",
     main="Total emissions from coal combustion-related sources in the United States")

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
