#' ---
#' title: "Class 05 R graphics intro"
#' author: "Angel Sorri-Battaroff"
#' date: "January 24th, 2019"
#' output: github_document
#' ---

#' Class 05 R graphics intro
#' This is some test and I can have **bold** and *italic* and 'code'
#' 
# My first boxplot
boxplot(rnorm(1000,0))

x <- rnorm(1000,0)
boxplot(x)

summary(x)
hist(x)

boxplot(x, horizontal = TRUE)
#' I have generated x and it has `r length(x)'

#Hands on Session 
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header=TRUE)
plot(weight$Age,weight$weight,typ = "o", pch=15,cex=1.5,lwd=2,ylim=c(2,10),xlab="Age(months)",ylab="weight(kg)",main="Baby age to weight")

#Session 2B
mouse <- read.table("bimm143_05_rstats/feature_counts.txt", sep="\t",header = TRUE)
barplot(mouse$Count)

par(mar=c(3.1, 11.1, 4.1, 2))
barplot(mouse$Count, names.arg=mouse$Feature, 
        horiz=TRUE, ylab="", 
        main="Number of features in the mouse GRCm38 genome", 
        las=1, xlim=c(0,80000))
# Session 2c Histograms

barplot(VADeaths,beside = FALSE)      

#Session 3
mf <- read.delim("bimm143_05_rstats/male_female_counts.txt")
barplot(mf$Count, names.arg=mf$Sample, col=rainbow(nrow(mf)),las=2,ylab="Counts")
par(mar=c(2, 10, 1, 1))    

genes <- read.delim("bimm143_05_rstats/up_down_expression.txt")
table(genes$State)
plot(genes$Condition1, genes$Condition2, col=genes$State, xlab="Expression condition 1", ylab="Expression condition 2")
palette()


palette(c("blue","gray","red"))
plot(genes$Condition1, genes$Condition2, col=genes$State, xlab="Expression condition 1", ylab="Expression condition 2")

#Session 3C Dynamic Use of Color

# Lets plot expresion vs gene regulation
meth <- read.delim("bimm143_05_rstats/expression_methylation.txt")
plot(meth$gene.meth, meth$expression)
dcols <- densCols(meth$gene.meth, meth$expression)

# Plot changing the plot character ('pch') to a solid circle
plot(meth$gene.meth, meth$expression, col = dcols, pch = 20)

# Find the indices of genes with above 0 expresion
inds <- meth$expression > 0

# Plot just these genes
plot(meth$gene.meth[inds], meth$expression[inds])

dcols.custom <- densCols(meth$gene.meth[inds], meth$expression[inds],
                         colramp = colorRampPalette(c("blue2",
                                                      "green2",
                                                      "red2",
                                                      "yellow")) )

plot(meth$gene.meth[inds], meth$expression[inds], 
     col = dcols.custom, pch = 20)

