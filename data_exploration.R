library(dplyr)
library(data.table)

tackles.DT <- as.data.table(readRDS("rds_data/tackles.rds"))
plays.DT <- as.data.table(readRDS("rds_data/plays.rds"))
games.DT <- as.data.table(readRDS("rds_data/games.rds"))
players.DT <- as.data.table(readRDS("rds_data/players.rds"))

# add player name to tackles data
tackles.DT <- merge(tackles.DT, players.DT[, .(nflId, displayName)], by = "nflId", all.x = TRUE)

# tackles and assists per play
tackles.and.assists.per.play <- tackles.DT[, .(total_tackles = sum(tackle), total_assists = sum(assist)),
                                           by = .(playId, gameId)]