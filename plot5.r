require("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mv_scc_codes <- subset(SCC, EI.Sector %in% 
                           c("Mobile - On-Road Gasoline Light Duty Vehicles",
                             "Mobile - On-Road Gasoline Heavy Duty Vehicles",
                             "Mobile - On-Road Diesel Light Duty Vehicles",
                             "Mobile - On-Road Diesel Heavy Duty Vehicles"))

mv_emissions <- subset(NEI, SCC %in% mv_scc_codes$SCC)
data <- subset(mv_emissions, fips=='24510')

data <- aggregate(data[4],data[6],FUN=sum,simplify=TRUE)
emissions <- as.matrix(data[2])
rownames(emissions) <- data[,1]

png("plot5.png")
barplot(t(emissions), 
        main="Motor Vehicle Emissions Over Time\nBaltimore City",
        xlab="Year", 
        ylab="PM in Tons")

dev.off()