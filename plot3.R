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

##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
##Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

subset_Balti <- NEI[NEI$fips=="24510",]
agg_tot_by_year <- aggregate(Emissions ~ year + type,subset_Balti,sum)
library(ggplot2)
png("plot3.png")
g <- ggplot(agg_tot_by_year,aes(factor(year),Emissions,color=type))
g <- g + facet_grid(.~type)
g <- g+geom_point() + xlab("years") + ylab(expression('total PM'[2.5]* 'Emissions'))+ ggtitle('total PM [2.5] Emissions at various years at various types for Baltimore')
print(g)
dev.off()