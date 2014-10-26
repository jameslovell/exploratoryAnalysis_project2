NEI <- readRDS("summarySCC_PM25.rds")

png("plot2.png")
data <- subset(NEI,fips=='24510')
data <- aggregate(data[4],data[6],FUN=sum,simplify=TRUE)
emissions <- as.matrix(data[2])
rownames(emissions) <- data[,1]
barplot(t(emissions), 
        main="Total Emissions Over Time\nBaltimore",
        xlab="Year", 
        ylab="PM in Tons")
dev.off()