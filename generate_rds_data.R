# List all CSV files in the "raw_data" folder
csv_files <- list.files("raw_data", pattern = "\\.csv$", full.names = TRUE)

# Loop through the CSV files and convert them to RDS format
for (csv_file in csv_files) {
  # Extract the file name (without extension) from the path
  file_name <- tools::file_path_sans_ext(basename(csv_file))
  
  # Read the CSV file
  data <- read.csv(csv_file)
  
  # Define the path for the corresponding RDS file in the "rds_data" folder
  rds_file_path <- file.path("rds_data", paste0(file_name, ".rds"))
  
  # Save the data as an RDS file in the "rds_data" folder
  saveRDS(data, rds_file_path)
  
  cat(paste("Saved", rds_file_path, "\n"))
}

# combine tracking data into one large file
tracking.DT <- as.data.table(readRDS("rds_data/tracking_week_1.rds"))
tracking.DT <- rbindlist(list(tracking.DT, as.data.table(readRDS("rds_data/tracking_week_2.rds"))))
tracking.DT <- rbindlist(list(tracking.DT, as.data.table(readRDS("rds_data/tracking_week_3.rds"))))
tracking.DT <- rbindlist(list(tracking.DT, as.data.table(readRDS("rds_data/tracking_week_4.rds"))))
tracking.DT <- rbindlist(list(tracking.DT, as.data.table(readRDS("rds_data/tracking_week_5.rds"))))
tracking.DT <- rbindlist(list(tracking.DT, as.data.table(readRDS("rds_data/tracking_week_6.rds"))))
tracking.DT <- rbindlist(list(tracking.DT, as.data.table(readRDS("rds_data/tracking_week_7.rds"))))
tracking.DT <- rbindlist(list(tracking.DT, as.data.table(readRDS("rds_data/tracking_week_8.rds"))))
tracking.DT <- rbindlist(list(tracking.DT, as.data.table(readRDS("rds_data/tracking_week_9.rds"))))

saveRDS(tracking.DT, "rds_data/tracking_all.rds")
