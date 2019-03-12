Graphics intro
================

``` r
#' Class 05 R graphics intro
#' This is some test and I can have **bold** and *italic* and 'code'
#' 
# My first boxplot
boxplot(rnorm(1000,0))
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-1.png)

``` r
x <- rnorm(1000,0)
boxplot(x)
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-2.png)

``` r
summary(x)
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -3.60973 -0.62787  0.06044  0.01627  0.69233  3.61903

``` r
hist(x)
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-3.png)

``` r
boxplot(x, horizontal = TRUE)
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-4.png)

``` r
#' I have generated x and it has `r length(x)'

#Hands on Session 
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header=TRUE)
plot(weight$Age,weight$weight,typ = "o", pch=15,cex=1.5,lwd=2,ylim=c(2,10),xlab="Age(months)",ylab="weight(kg)",main="Baby age to weight")
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-5.png)

``` r
#Session 2B
mouse <- read.table("bimm143_05_rstats/feature_counts.txt", sep="\t",header = TRUE)
barplot(mouse$Count)
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-6.png)

``` r
par(mar=c(3.1, 11.1, 4.1, 2))
barplot(mouse$Count, names.arg=mouse$Feature, 
        horiz=TRUE, ylab="", 
        main="Number of features in the mouse GRCm38 genome", 
        las=1, xlim=c(0,80000))
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-7.png)

``` r
# Session 2c Histograms

barplot(VADeaths,beside = FALSE)      
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-8.png)

``` r
#Session 3
mf <- read.delim("bimm143_05_rstats/male_female_counts.txt")
barplot(mf$Count, names.arg=mf$Sample, col=rainbow(nrow(mf)),las=2,ylab="Counts")
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-9.png)

``` r
par(mar=c(2, 10, 1, 1))    

genes <- read.delim("bimm143_05_rstats/up_down_expression.txt")
table(genes$State)
```

    ## 
    ##       down unchanging         up 
    ##         72       4997        127

``` r
plot(genes$Condition1, genes$Condition2, col=genes$State, xlab="Expression condition 1", ylab="Expression condition 2")
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-10.png)

``` r
palette()
```

    ## [1] "black"   "red"     "green3"  "blue"    "cyan"    "magenta" "yellow" 
    ## [8] "gray"

``` r
palette(c("blue","gray","red"))
plot(genes$Condition1, genes$Condition2, col=genes$State, xlab="Expression condition 1", ylab="Expression condition 2")
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-11.png)

``` r
#Session 3C Dynamic Use of Color

# Lets plot expresion vs gene regulation
meth <- read.delim("bimm143_05_rstats/expression_methylation.txt")
plot(meth$gene.meth, meth$expression)
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-12.png)

``` r
dcols <- densCols(meth$gene.meth, meth$expression)

# Plot changing the plot character ('pch') to a solid circle
plot(meth$gene.meth, meth$expression, col = dcols, pch = 20)
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-13.png)

``` r
# Find the indices of genes with above 0 expresion
inds <- meth$expression > 0

# Plot just these genes
plot(meth$gene.meth[inds], meth$expression[inds])
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-14.png)

``` r
dcols.custom <- densCols(meth$gene.meth[inds], meth$expression[inds],
                         colramp = colorRampPalette(c("blue2",
                                                      "green2",
                                                      "red2",
                                                      "yellow")) )

plot(meth$gene.meth[inds], meth$expression[inds], 
     col = dcols.custom, pch = 20)
```

![](class05_files/figure-markdown_github/unnamed-chunk-1-15.png)
