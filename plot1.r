NEI <- readRDS("summarySCC_PM25.rds")

png("plot1.png")
data <- aggregate(NEI[4],NEI[6],FUN=sum,simplify=TRUE)
emissions <- as.matrix(data[2])
rownames(emissions) <- data[,1]
barplot(t(emissions), 
        main="Total Emissions Over Time", 
        xlab="Year", 
        ylab="PM in Tons")
dev.off()