## PCA for Full Dataset

library(spicyR)

tmp2 <- read.csv("ROI.GROUP.AREA.data (1).csv")


tmp <- runPCA(sce.Full.ICMvsDCM,
              ncomponents = 10,
              scale = TRUE,
              exprs_values = "asinh_rescale",
              name = "PCA")
scater::plotPCA(
  sce.Full.ICMvsDCM, 
  colour_by = "Batch")

cellProp <- getProp(sce.Full.ICMvsDCM, feature = "annotated_metacluster", image = "roi")

cellProp

ilr_transform <- ilr(cellProp)
pca_ilr <- prcomp(ilr_transform, center = TRUE, scale = FALSE)

ilrDf <- data.frame(ROI = rownames(pca_ilr$x),
                    PC1 = pca_ilr$x[,1],
                    PC2 = pca_ilr$x[,2])

ilrDf <- left_join(ilrDf, tmp2, by = "ROI")

p1 <- ggplot(ilrDf, aes(x = PC1, y = PC2, color = Scar_Ilastik)) +
  geom_point() +
  scale_color_viridis(option = "G")

p2 <- ggplot(ilrDf, aes(x = PC1, y = PC2, color = Myocardium_Ilastik)) +
  geom_point() +
  scale_color_viridis(option = "G")

p3 <- ggplot(ilrDf, aes(x = PC1, y = PC2, color = Background_Ilastik)) +
  geom_point() +
  scale_color_viridis(option = "G")

p4 <- ggplot(ilrDf, aes(x = PC1, y = PC2, color = Proportion_Ilastik)) +
  geom_point() +
  scale_color_viridis(option = "G")

p1+p2+p3+p4

p1 <- ggplot(ilrDf, aes(x = PC1, y = PC2, color = Total_ImageJ)) +
  geom_point() +
  scale_color_viridis(option = "G")

p2 <- ggplot(ilrDf, aes(x = PC1, y = PC2, color = Tisssue_Area_ImageJ)) +
  geom_point() +
  scale_color_viridis(option = "G")

p3 <- ggplot(ilrDf, aes(x = PC1, y = PC2, color = Scar_ImageJ)) +
  geom_point() +
  scale_color_viridis(option = "G")

p4 <- ggplot(ilrDf, aes(x = PC1, y = PC2, color = Proportion_ImageJ)) +
  geom_point() +
  scale_color_viridis(option = "G")

p1+p2+p3+p4


# Assume pca_result is your PCA result from prcomp() on log-ratio transformed data
loadings <- pca_ilr$rotation  # The loadings of the PCA

# Square the loadings to get the variance explained by each variable for each component
squared_loadings <- loadings^2

# Calculate the percentage contribution of each cell type to each PC
percentage_contributions <- sweep(squared_loadings, 2, colSums(squared_loadings), FUN="/") * 100
percentage_contributions <- as.data.frame(percentage_contributions)
# View the percentage contribution for the first few PCs
percentage_contributions[, 1:3] |> View() # Adjust the number of PCs as needed

percentage_contributions <- rownames_to_column(percentage_contributions, "cellType")

percentage_contributions <- percentage_contributions |> tidyr::pivot_longer(cols = starts_with("PC"),
                                                                            names_to = "PC",
                                                                            values_to = "Contribution")

percentage_contributions |>
  filter(PC %in% c("PC1", "PC2")) |>
  ggplot(aes(x = reorder(cellType, -Contribution), y = Contribution, fill = PC)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))








##### Composition not transformed

pca <- prcomp(cellProp)

pca$x
tmp3 <- data.frame(ROI = rownames(pca$x),
                   PC1 = pca$x[,1],
                   PC2 = pca$x[,2])

tmp4 <- left_join(tmp3, tmp2, by = "ROI")

p1 <- ggplot(tmp4, aes(x = PC1, y = PC2, color = Scar_Ilastik)) +
  geom_point() +
  scale_color_viridis(option = "G")

p2 <- ggplot(tmp4, aes(x = PC1, y = PC2, color = Myocardium_Ilastik)) +
  geom_point() +
  scale_color_viridis(option = "G")

p3 <- ggplot(tmp4, aes(x = PC1, y = PC2, color = Background_Ilastik)) +
  geom_point() +
  scale_color_viridis(option = "G")

p4 <- ggplot(tmp4, aes(x = PC1, y = PC2, color = Proportion_Ilastik)) +
  geom_point() +
  scale_color_viridis(option = "G")

p1+p2+p3+p4

pdf.options(width=10, height=5)
pdf(file=file.path("Ilastik.pdf"))
print(p1+p2+p3+p4 + labs(title=""))
dev.off()


ggplot(tmp4, aes(x = PC1, y = PC2, color = Group)) +
  geom_point() +
  scale_colour_brewer(palette = "Dark2")

p2 <- ggplot(tmp4, aes(x = PC1, y = PC2, color = Tisssue_Area_ImageJ)) +
  geom_point() +
  scale_color_viridis(option = "G")

p3 <- ggplot(tmp4, aes(x = PC1, y = PC2, color = Scar_ImageJ)) +
  geom_point() +
  scale_color_viridis(option = "G")

p4 <- ggplot(tmp4, aes(x = PC1, y = PC2, color = Proportion_ImageJ)) +
  geom_point() +
  scale_color_viridis(option = "G")

pdf.options(width=10, height=5)
pdf(file=file.path("ImageJ.pdf"))
print(p1+p2+p3+p4 + labs(title=""))
dev.off()

lm(Scar_ImageJ ~ PC1, data = tmp4) |> summary()
lm(Tisssue_Area_ImageJ ~ PC2, data = ilrDf) |> summary()


# Assume pca_result is your PCA result from prcomp() on log-ratio transformed data
loadings <- pca$rotation  # The loadings of the PCA

# Square the loadings to get the variance explained by each variable for each component
squared_loadings <- loadings^2

# Calculate the percentage contribution of each cell type to each PC
percentage_contributions <- sweep(squared_loadings, 2, colSums(squared_loadings), FUN="/") * 100
percentage_contributions <- as.data.frame(percentage_contributions)
# View the percentage contribution for the first few PCs
percentage_contributions[, 1:3] |> View() # Adjust the number of PCs as needed

percentage_contributions <- rownames_to_column(percentage_contributions, "cellType")

write.csv(percentage_contributions, file = "PC_contributions.csv")

percentage_contributions <- percentage_contributions |> tidyr::pivot_longer(cols = starts_with("PC"),
                      names_to = "PC",
                      values_to = "Contribution")

percentage_contributions |>
  filter(PC %in% c("PC1", "PC2")) |>
  ggplot(aes(x = reorder(cellType, -Contribution), y = Contribution, fill = PC)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

ggplot(ilrDf, aes(x = PC2, y = Tisssue_Area_ImageJ)) +
  geom_point() +
  geom_smooth(method = "lm")

ggplot(tmp4, aes(x = PC2, y = Proportion_ImageJ)) +
  geom_point() +
  geom_smooth(method = "lm")
pca$rotation[,1:2] |> as.data.frame()  |> signif(digits = 2) |> View()

pca$rotation |>
  as.data.frame() |>
  rownames_to_column("cellType") |>
  pivot_longer(cols = starts_with("PC"),
               names_to = "PC",
               values_to = "magnitude") |>
  filter(PC %in% c("PC1", "PC2")) |>
  ggplot(aes(x = reorder(cellType, -magnitude), y = magnitude, fill = PC)) +
  geom_bar(stat = "identity", color = "black", position = "dodge") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))





