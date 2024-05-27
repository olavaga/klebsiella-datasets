library(R.utils)

if (.Platform$OS.type == "windows") {
	download.method = "wininet"

} else if (.Platform$OS.type == "unix") {
	download.method = "wget"

} else {
	stop("Unknown Operating System")
}

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
		download.file(url=paste0(pathogen.watch.endpoint,filename,".gz"),
			      destfile=paste0("../raw/",filename,".gz"),
			      method=download.method)
		gunzip(paste0("../raw/",filename,".gz"))
	}
}


