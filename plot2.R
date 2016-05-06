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

##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
##from 1999 to 2008? Use the base plotting system to make a plot answering this question.

subset_Balti <- NEI[NEI$fips=="24510",]
agg_tot_by_year <- aggregate(Emissions ~ year,subset_Balti,sum)
png("plot2.png")
barplot(height = agg_tot_by_year$Emissions,names.arg=agg_tot_by_year$year,xlab="years",ylab=expression('total PM'[2.5]* 'Emissions'),main=expression('total PM'[2.5]* 'Emissions at various years for Baltimore'))
dev.off()