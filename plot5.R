## To check for the existence of NEI file.
if(!exists("NEI"))
{
  NEI <- readRDS("summarySCC_PM25.rds")
}

## To check for the existence of SCC file
if(!exists("SCC"))
{
  SCC <- readRDS("Source_Classification_Code.rds")
}

##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(ggplot2)

NEIsubset <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]

agg_tot_by_year <- aggregate(Emissions ~ year,NEIsubset,sum)

png("plot5.png")

g <- ggplot(agg_tot_by_year,aes(factor(year),Emissions))
g <- g+geom_bar(stat="identity") + xlab("years") + ylab(expression('total PM'[2.5]* 'Emissions'))+ ggtitle('total PM [2.5] Emissions at various years for Vehicles at Baltimore')
print(g)
dev.off()

