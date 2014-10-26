require("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#discover the scc codes of interest for the plots
mv_scc_codes <- subset(SCC, EI.Sector %in% 
                         c("Mobile - On-Road Gasoline Light Duty Vehicles",
                           "Mobile - On-Road Gasoline Heavy Duty Vehicles",
                           "Mobile - On-Road Diesel Light Duty Vehicles",
                           "Mobile - On-Road Diesel Heavy Duty Vehicles"))

#retrieve only the data that belongs to the SCC codes of interest
mv_emissions <- subset(NEI, SCC %in% mv_scc_codes$SCC)
#get the data for Baltimore City and Los Angeles County
data <- subset(mv_emissions, fips=='24510' | fips=='06037')
#change the fips code to the locations of interest for plotting
data$fips <- as.character(data$fips)
data$fips[data$fips == '06037'] <- "Los Angeles County"
data$fips[data$fips == '24510'] <- "Baltimore City"
data$fips <- as.factor(data$fips)

#prepare the data for plotting
data <- aggregate(data[c("Emissions")], list(Location = data$fips, year = data$year), sum)

#plot
png("plot6.png")
plot <- ggplot(data, aes(x=year, y=Emissions, colour=Location)) 
plot = plot + geom_point()
plot = plot + geom_line()
plot = plot + ggtitle("Total Emissions by City and Year\nBaltimore City and Los Angeles County")
plot = plot + xlab("Year")
plot = plot + ylab("Total" ~ PM[25] ~ "Emissions (tons)")
plot
dev.off()