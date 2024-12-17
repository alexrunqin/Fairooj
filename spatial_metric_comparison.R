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

spicyTestDCM1 <- spicy(
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

spicyTestDCM2 <- spicy(
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

# sanityCheck <- spicy(
#   cells = sce.DCM.RF.IF,
#   condition = "group",
#   cellType = "annotated_metacluster",
#   imageID = "roi",
#   spatialCoords = c("x", "y"),
#   Rs = c(20, 50, 80,110,140,170),
#   sigma = 50,
#   # weights = FALSE,
#   BPPARAM = BPPARAM
# )

# bind(spicyTestDCM2)[, c("imageID","Endo__Endo")]
# 
# bind(sanityCheck)[, c("imageID","Endo__Endo")]


df1 <- bind(spicyTestICM1)
df2 <- bind(spicyTestICM2)
df3 <- bind(spicyTestDCM1)
df4 <- bind(spicyTestDCM2)

ICM_merge <- rbind.fill(df1, df2)
DCM_merge <- rbind(df3, df4)

all_merge <- rbind(ICM_merge, DCM_merge)

all_merge <- all_merge |>
  separate(condition, into = c("fibrosis", "aetiology"), sep = "_")

all_merge$fibrosis <- factor(all_merge$fibrosis, levels = c("Remote", "IF", "RF", "RFC"))

patientData <- sce.Full.ICMvsDCM[,!duplicated(sce.Full.ICMvsDCM$roi)] |>
  colData() |>
  as.data.frame()

patientData <- patientData |>
  separate(sample, into = c("fibrosis", "aetiology", "patient"), sep = "_")

filtPatientData <- data.frame(imageID = patientData$roi,
                              fibrosis = patientData$fibrosis,
                              aetiology = patientData$aetiology,
                              patient = patientData$patient)


all_merge <- inner_join(filtPatientData, all_merge)

mean_merged <- all_merge |>
  group_by(fibrosis, aetiology, patient) |>
  summarise(n = n(),
            mean = mean(`ResMac__Fib2`))

mean_merged$fibrosis <- factor(mean_merged$fibrosis, levels = c("Remote", "IF", "RF", "RFC"))
mean_merged$aetiology <- factor(mean_merged$aetiology, levels = c("ICM", "DCM"))

ggplot(mean_merged, aes(x = fibrosis, y = mean, fill = aetiology)) +
  geom_bar(color = "black", stat = "summary", fun = "mean", position = position_dodge(width = 0.75), width = 0.7) +
  geom_point(data = mean_merged, aes(x = fibrosis, y = mean, group = aetiology), 
             position = position_dodge(width = 0.75), size = 2, shape = 21, color = "black") +
  stat_summary(fun.data = "mean_se", geom = "errorbar", 
               position = position_dodge(width = 0.75), width = 0.25) +
  labs(x = "Fibrosis", y = "Mean", fill = "Aetiology") +
  theme_minimal()

mean_sd <- mean_merged |>
  group_by(fibrosis, aetiology) |>
  summarise(mean1 = mean(`mean`, na.rm = TRUE),
            sd1 = sd(`mean`, na.rm = TRUE),
            n = sum(!is.na(`mean`)))

write.csv(mean_sd, "mean_sd.csv")

res.aov2 <- aov(mean ~ fibrosis * aetiology, data = mean_merged)
summary(res.aov2)

TukeyHSD(res.aov2, which = "fibrosis:aetiology") |> View()

allpairwise <- TukeyHSD(res.aov2, which = "fibrosis:aetiology")[["fibrosis:aetiology"]]

par(mar = c(4.1, 13.5, 4.2, 2.1))
plot(TukeyHSD(res.aov2, which = "fibrosis:aetiology"),
     las = 2)

library(multcomp)
summary(glht(res.aov2, linfct = mcp(fibrosis = "Tukey")))

TukeyHSD(res.aov2, which = "fibrosis")
