require("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")

#get just the data for Baltimore City
data <- subset(NEI,fips=='24510')
#prepare the data for plotting
data <- aggregate(data[c("Emissions")], list(type = data$type, year = data$year), sum)
#plot  
png("plot3.png")
plot <- ggplot(data, aes(x=year, y=Emissions, colour=type)) 
plot = plot + geom_point()
plot = plot + geom_line()
plot = plot + ggtitle("Total Emissions by Type and Year\nIn Baltimore City")
plot

dev.off()
