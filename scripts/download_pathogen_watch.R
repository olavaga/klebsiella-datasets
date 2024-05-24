library(R.utils)

pathogen.watch.endpoint <- "https://pathogenwatch-public.ams3.cdn.digitaloceanspaces.com/"

files <- c("Klebsiella pneumoniae__kleborate.csv",
	   "Klebsiella pneumoniae__cgmlst.csv",
	   "Klebsiella pneumoniae__inctyper.csv",
	   "Klebsiella pneumoniae__metadata.csv",
	   "Klebsiella pneumoniae__metrics.csv",
	   "Klebsiella pneumoniae__mlst.csv")

for (filename in files) {
	if (!file.exists(paste0("../raw/",filename))) {
		dir.create("../raw/", showWarnings=FALSE)
		download.file(paste0(pathogen.watch.endpoint,filename,".gz"),
			      paste0("../raw/",filename,".gz"),
			      method="wget")
		gunzip(paste0("../raw/",filename,".gz"))
	}
}


