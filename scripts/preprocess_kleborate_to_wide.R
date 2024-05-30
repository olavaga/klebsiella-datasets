kleborate.df <- read.csv("../raw/Klebsiella pneumoniae__kleborate.csv")

# Pick only columns that have strong hits for antibiotic resistance genes
selection <- colnames(kleborate.df)[endsWith(colnames(kleborate.df),
                                             "_acquired")]

# Collapse columns to list of character vectors only containing present genes
obs <- apply(kleborate.df[, selection], 1, paste, collapse=';')
obs <- gsub("(-;|;-)","", obs)
obs <- strsplit(obs, ";")

# Remove " +13V" like syntax (unknown significance)
obs <- sapply(obs, \(x) gsub(" \\+[0-9][0-9][0-9]?[A-Z]$", "", x))

# Remove asterix, hats and questionmarks all denoting distance to known alleles
obs <- sapply(obs, \(x) gsub("[*^?]*$", "", x))

# Create a list of all unique columns
columns <- sort(unique(c(unlist(obs))))
columns <- columns[columns != '-']

# Create a matrix of 1s and 0s denoting presense/absense for all genes
m <- t(sapply(obs, \(x) as.numeric(columns %in% x)))

# Create the dataframe
df <- data.frame(m)
colnames(df) <- columns
df <- cbind(id = kleborate.df$Genome.Name, df)

# Write it to file
dir.create("../clean", showWarnings=FALSE)
write.csv(df, 
          file = "../clean/kleborate-wide-binary.csv",
          row.names=FALSE)