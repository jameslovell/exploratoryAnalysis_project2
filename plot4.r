require("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#select the SCC codes for the data of interest
coal_scc_codes <- subset(SCC, EI.Sector %in% 
                    c("Fuel Comb - Comm/Institutional - Coal",
                      "Fuel Comb - Electric Generation - Coal",
                      "Fuel Comb - Industrial Boilers, ICEs - Coal"))

#retrieve only the data that is needed
coal_emissions <- subset(NEI, SCC %in% coal_scc_codes$SCC)

#prepare the data for plotting
data <- aggregate(coal_emissions[4],coal_emissions[6],FUN=sum,simplify=TRUE)
emissions <- as.matrix(data[2])
rownames(emissions) <- data[,1]

#plot
png("plot4.png")
barplot(t(emissions), 
        main="Coal Cumbustion Emissions Over Time",
        xlab="Year", 
        ylab="PM in Tons")

dev.off()