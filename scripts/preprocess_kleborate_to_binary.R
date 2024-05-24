kleborate.df <- read.csv("../raw/Klebsiella pneumoniae__kleborate.csv")

selection <- colnames(kleborate.df)[endsWith(colnames(kleborate.df),
                                                 "_acquired")]

resistance.df <- kleborate.df[, selection]
colnames(resistance.df) <- gsub("_acquired","",colnames(resistance.df))
selection <- colnames(resistance.df)

resistance.df <- as.data.frame(apply(resistance.df,
                                     c(1,2),
                                     \(x) ifelse(x=="-", 0, 1)))

write.csv(cbind(id=kleborate.df$Genome.Name, resistance.df),
          paste0("../clean/kleborate-ARGs-binary.csv"),
          row.names=FALSE)
