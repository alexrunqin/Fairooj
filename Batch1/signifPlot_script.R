myfunc <- function(v1) {
  deparse(substitute(v1))
}

# library(spicyR)

devtools::load_all("~/spicyR")

BPPARAM <- simpleSeg:::generateBPParam(cores = 30)

spicyTestICM1 <- spicy(
  cells = sce.ICM.IF.Remote,
  condition = "group",
  cellType = "annotated_metacluster",
  imageID = "roi",
  spatialCoords = c("x", "y"),
  Rs = c(20, 50, 80,110,140,170),
  sigma = 50,
  # weights = FALSE,
  BPPARAM = BPPARAM
)

topPairs(spicyTest, n = 20)

p <- signifPlot(
  spicyTest,
  breaks = c(-1.5, 3, 0.5),
  fdr = TRUE
)

name <- "sce.ICM.IF.Remote"

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch1/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}


###
spicyTest <- spicy(
  cells = sce.ICM.RF.IF,
  condition = "group",
  cellType = "annotated_metacluster",
  imageID = "roi",
  spatialCoords = c("x", "y"),
  Rs = c(20, 50, 80,110,140,170),
  sigma = 50,
  # weights = FALSE,
  BPPARAM = BPPARAM
)

topPairs(spicyTest, n = 20)

p <- signifPlot(
  spicyTest,
  breaks = c(-1.5, 3, 0.5),
  fdr = TRUE
)

name <- "sce.ICM.RF.IF"

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch1/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}


###
spicyTest <- spicy(
  cells = sce.ICM.RF.Remote,
  condition = "group",
  cellType = "annotated_metacluster",
  imageID = "roi",
  spatialCoords = c("x", "y"),
  Rs = c(20, 50, 80,110,140,170),
  sigma = 50,
  # weights = FALSE,
  BPPARAM = BPPARAM
)

topPairs(spicyTest, n = 20)

p <- signifPlot(
  spicyTest,
  breaks = c(-1.5, 3, 0.5),
  fdr = TRUE
)

name <- myfunc(sce.ICM.RF.Remote)

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch1/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}


###
spicyTest <- spicy(
  cells = sce.ICM.RFC.IF,
  condition = "group",
  cellType = "annotated_metacluster",
  imageID = "roi",
  spatialCoords = c("x", "y"),
  Rs = c(20, 50, 80,110,140,170),
  sigma = 50,
  # weights = FALSE,
  BPPARAM = BPPARAM
)

topPairs(spicyTest, n = 20)

p <- signifPlot(
  spicyTest,
  breaks = c(-1.5, 3, 0.5),
  fdr = TRUE
)

name <- myfunc(sce.ICM.RFC.IF)

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch1/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}


###
spicyTest <- spicy(
  cells = sce.ICM.RFC.Remote,
  condition = "group",
  cellType = "annotated_metacluster",
  imageID = "roi",
  spatialCoords = c("x", "y"),
  Rs = c(20, 50, 80,110,140,170),
  sigma = 50,
  # weights = FALSE,
  BPPARAM = BPPARAM
)

topPairs(spicyTest, n = 20)

p <- signifPlot(
  spicyTest,
  breaks = c(-1.5, 3, 0.5),
  fdr = TRUE
)

name <- myfunc(sce.ICM.RFC.Remote)

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch1/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}


###
spicyTestICM2 <- spicy(
  cells = sce.ICM.RFC.RF,
  condition = "group",
  cellType = "annotated_metacluster",
  imageID = "roi",
  spatialCoords = c("x", "y"),
  Rs = c(20, 50, 80,110,140,170),
  sigma = 50,
  # weights = FALSE,
  BPPARAM = BPPARAM
)

topPairs(spicyTest, n = 20)

p <- signifPlot(
  spicyTest,
  breaks = c(-1.5, 3, 0.5),
  fdr = TRUE
)

name <- "sce.ICM.RFC.RF"

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch1/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}