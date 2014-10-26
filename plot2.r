NEI <- readRDS("summarySCC_PM25.rds")

png("plot2.png")
#get only the data for Baltimore City
data <- subset(NEI,fips=='24510')
#Summarize the data for plotting
data <- aggregate(data[4],data[6],FUN=sum,simplify=TRUE)
#prepare the data for plotting
emissions <- as.matrix(data[2])
rownames(emissions) <- data[,1]
#plot
barplot(t(emissions), 
        main="Total Emissions Over Time\nBaltimore",
        xlab="Year", 
        ylab="PM in Tons")
dev.off()