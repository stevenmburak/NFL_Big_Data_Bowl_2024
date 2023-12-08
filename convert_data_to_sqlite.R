library(RSQLite)

sqlite_con <- dbConnect(RSQLite::SQLite(), dbname = "sqlite_data/nfl.db")

#dbWriteTable(sqlite_con, name = "tracking_all", value = tracking.DT, overwrite = TRUE)
