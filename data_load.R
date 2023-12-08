source("lhelpers.R")

tackles.DT <- as.data.table(readRDS("rds_data/tackles.rds"))
plays.DT <- as.data.table(readRDS("rds_data/plays.rds"))
games.DT <- as.data.table(readRDS("rds_data/games.rds"))
players.DT <- as.data.table(readRDS("rds_data/players.rds"))
tracking.DT <- as.data.table(readRDS("rds_data/tracking_all.rds"))