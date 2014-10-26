NEI <- readRDS("summarySCC_PM25.rds")

png("plot1.png")
#summarize data in preparation for plotting
data <- aggregate(NEI[4],NEI[6],FUN=sum,simplify=TRUE)
#prepare the data for plotting
emissions <- as.matrix(data[2])
rownames(emissions) <- data[,1]
#plot the data
barplot(t(emissions), 
        main="Total Emissions Over Time", 
        xlab="Year", 
        ylab="PM in Tons")
dev.off()