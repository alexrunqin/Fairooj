
spicyTest <- spicy(
  cells = sce.DCM.IF.Remote,
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

name <- myfunc(sce.DCM.IF.Remote)

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch3/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}


###
spicyTest <- spicy(
  cells = sce.DCM.RF.IF,
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

name <- myfunc(sce.DCM.RF.IF)

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch3/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}


###
spicyTest <- spicy(
  cells = sce.DCM.RF.Remote,
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

name <- myfunc(sce.DCM.RF.Remote)

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch3/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}


###
spicyTest <- spicy(
  cells = sce.DCM.RFC.IF,
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

name <- myfunc(sce.DCM.RFC.IF)

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch3/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}


###
spicyTest <- spicy(
  cells = sce.DCM.RFC.Remote,
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

name <- myfunc(sce.DCM.RFC.Remote)

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch2/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}

set.seed(51773)
###
spicyTest <- spicy(
  cells = sce.DCM.RFC.RF,
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
  # fdr = TRUE
)

name <- myfunc(sce.DCM.RFC.RF)

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch2/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}