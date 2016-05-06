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

##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission 
##from all sources for each of the years 1999, 2002, 2005, and 2008.

agg_tot_by_year <- aggregate(Emissions ~ year,NEI,sum)
png("plot1.png")
barplot(height = agg_tot_by_year$Emissions,names.arg=agg_tot_by_year$year,xlab="years",ylab=expression('total PM'[2.5]* 'Emissions'),main=expression('total PM'[2.5]* 'Emissions at various years'))
dev.off()