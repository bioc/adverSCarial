library(RUnit)
library(adverSCarial)

runTests <- function() {
    test_advModifications()
    test_predictWithNewValue()
    test_advMaxChange()
    test_advSingleGene()
    test_maxChangeOverview()
    test_singleGeneOverview()
    test_advGridMinChange()
    test_advRandWalkMinChange()
}

test_advModifications <- function () {
    exprs <- data.frame(a=c(0,0,0,0), b=c(1,1,1,1), c=c(2,2,3,3))
    genes <- c("a")
    clusters <- c("b","b","t","t")
    exprs_res1 <- data.frame(a=c(10,10,0,0), b=c(1,1,1,1), c=c(2,2,3,3))
    checkTrue( all(advModifications(exprs, genes, clusters, "b",
        advMethod = "fixed",
        advFixedValue = 10, argForClassif='data.frame') == exprs_res1))
    checkTrue(all(advModifications(
        data.frame(a=c(1)), "a", "a", "a") == 1))
}



MyClassifier <- function(expr, clusters, target) {
    c("b", 0.5)
}

test_predictWithNewValue <- function(){
    exprs <- data.frame(a=c(0,0,0,0), b=c(1,1,1,1), c=c(2,2,3,3))
    genes <- c("a")
    clusters <- c("b","b","t","t")
    checkTrue(all(predictWithNewValue(exprs, genes, clusters, "b",
                                MyClassifier) == c("b", 0.5)))
}

test_advMaxChange <- function(){
    exprs <- data.frame(a=c(0,0,0,0), b=c(1,1,1,1), c=c(2,2,3,3))
    clusters <- c("b","b","t","t")
    checkTrue(length(advMaxChange(exprs, clusters, "b", MyClassifier)@values) == 3)
}

test_advSingleGene <- function(){
    exprs <- data.frame(a=c(0,0,0,0), b=c(1,1,1,1), c=c(2,2,3,3))
    clusters <- c("b","b","t","t")
    checkTrue(length(advSingleGene(exprs, clusters, "b", MyClassifier)@values) == 0)
}

test_maxChangeOverview <- function(){
    exprs <- data.frame(a=c(0,0,0,0), b=c(1,1,1,1), c=c(2,2,3,3))
    clusters <- c("b","b","t","t")
    checkTrue(all(dim(maxChangeOverview(exprs, clusters, MyClassifier))==c(2,2)))
}

test_singleGeneOverview <- function(){
    exprs <- data.frame(a=c(0,0,0,0), b=c(1,1,1,1), c=c(2,2,3,3))
    clusters <- c("b","b","t","t")
    checkTrue(all(dim(singleGeneOverview(exprs, clusters, MyClassifier))==c(2,2)))
}

test_advGridMinChange <- function(){
    exprs <- data.frame(a=c(0,0,0,0), b=c(1,1,1,1), c=c(2,2,3,3))
    genes <- c("a")
    clusters <- c("b","b","t","t")

    checkTrue(all(dim(advGridMinChange(exprs, clusters, "b", MyClassifier,
                genes)) == c(3,5)))
}

test_advRandWalkMinChange <- function(){
    exprs <- data.frame(a=c(0,0,0,0), b=c(1,1,1,1), c=c(2,2,3,3))
    genes <- c("a")
    clusters <- c("b","b","t","t")

    checkTrue(all(dim(advRandWalkMinChange(exprs,
        clusters, "b", MyClassifier, genes)) == c(3,6)))
}