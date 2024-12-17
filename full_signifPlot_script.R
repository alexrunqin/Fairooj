spicyTest <- spicy(
  cells = sce.Full.ICMvsDCM,
  condition = "aetiology",
  cellType = "annotated_metacluster",
  imageID = "roi",
  spatialCoords = c("x", "y"),
  Rs = c(20, 50, 80,110,140,170),
  sigma = 50,
  # weights = FALSE,
  BPPARAM = BPPARAM
)

topPairs(spicyTest, n = 20)

p1 <- signifPlot(
  spicyTest,
  breaks = c(-1.5, 3, 0.5),
  fdr = TRUE
)

p2 <- signifPlot(
  spicyTest,
  breaks = c(-1.5, 3, 0.5)
)

p

# name <- myfunc(sce.Full.ICMvsDCM)
# 
# if (TRUE) {
#   pdf.options(width=20, height=18)
#   pdf(file=file.path(paste0(name, ".pdf")))
#   print(p + labs(title=""))
#   dev.off()
# }
