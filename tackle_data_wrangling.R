source("helpers.R")

# Let's first determine any plays 

# assign points for an assist
tackles.DT[, tackle_points := tackle + 0.5*assist]

# add player name to tackles data
tackles.DT <- merge(tackles.DT, players.DT[, .(nflId, displayName)], by = "nflId", all.x = TRUE)

# assign total or assist indicator - shows 1 if player got a tackle or an assist on the play
tackles.DT[, tackle_or_assist := tackle + assist]

# tackles and assists per play
tackles.and.assists.per.play <- tackles.DT[, .(total_tackles = sum(tackle), total_assists = sum(assist)),
                                           by = .(playId, gameId)]

# tackle points by player
tackle.points.by.player <- tackles.DT[, .(tackle_points = sum(tackle_points)), by = .(nflId, displayName)]

players.per.play <- tracking.DT[, .(player_count = n_distinct(nflId)), by = .(gameId, playId)]

