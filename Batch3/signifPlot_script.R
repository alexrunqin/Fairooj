spicyTest <- spicy(
  cells = sce.IF.ICMvsDCM,
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

name <- myfunc(sce.IF.ICMvsDCM)

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch3/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}


###
spicyTest <- spicy(
  cells = sce.Remote.ICMvsDCM,
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

name <- myfunc(sce.Remote.ICMvsDCM)

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch3/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}


###
spicyTest <- spicy(
  cells = sce.RF.ICMvsDCM,
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

name <- myfunc(sce.RF.ICMvsDCM)

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch3/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}


###
spicyTest <- spicy(
  cells = sce.RFC.ICMvsDCM,
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

name <- myfunc(sce.RFC.ICMvsDCM)

if (TRUE) {
  pdf.options(width=20, height=18)
  pdf(file=file.path(paste0("Batch3/", name, "corrected.pdf")))
  print(p + labs(title=""))
  dev.off()
}