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

## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Due to space issue, subset for coal combustion-related sources before merging two datasets

library(ggplot2)

SCCcoal <- grepl("coal",SCC$Short.Name,ignore.case = TRUE)
SCCcoal_sub <- SCC[SCCcoal,]

NEISCC <- merge(NEI,SCCcoal_sub,by="SCC")

agg_tot_by_year <- aggregate(Emissions ~ year,NEISCC,sum)

png("plot4.png")

g <- ggplot(agg_tot_by_year,aes(factor(year),Emissions))
g <- g+geom_bar(stat="identity") + xlab("years") + ylab(expression('total PM'[2.5]* 'Emissions'))+ ggtitle('total PM [2.5] Emissions at various years for coal combustion')
print(g)
dev.off()

