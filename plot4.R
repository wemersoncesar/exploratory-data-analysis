combRel <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRel <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalComb <- (combRel & coalRel)
combSCC <- SCC[coalComb,]$SCC
combNEI <- NEI[NEI$SCC %in% combSCC,]

library(ggplot2)

ggp <- ggplot(combNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions Across US from 1999-2008"))

print(ggp)