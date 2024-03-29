% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sceConvertToHGNC.R
\name{sceConvertToHGNC}
\alias{sceConvertToHGNC}
\title{Returns a SingleCellExperiment object keeping unique HGNC gene}
\usage{
sceConvertToHGNC(sce)
}
\arguments{
\item{sce}{SingleCellExperiment object to convert}
}
\value{
the SingleCellExperiment object keeping unique HGNC gene
}
\description{
Returns a SingleCellExperiment object keeping unique HGNC gene
}
\details{
Sometimes classifiers need HGNC instead of ensemble genes
to run. This function allows to make the conversion.
}
\examples{
library(TENxPBMCData)

pbmc <- TENxPBMCData(dataset = "pbmc3k")
hgnc_pbmc <- sceConvertToHGNC(pbmc)

}
