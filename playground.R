
tracking.DT <- as.data.table(read.csv("raw_data/tracking_week_1.csv"))

plays.DT <- as.data.table(read.csv("raw_data/plays.csv"))
plays.DT[, passPlay := ifelse(passResult == "C", "Y", "N")]

# tracking data: each row is unique by the following 4 columns: gameId, playId, frameId, nflId

# ball coordinates
ball.coordinates <- tracking.DT[is.na(nflId), .(gameId, playId, frameId,
                                                ball.x = x, # rename to ball.x for easier joining later
                                                ball.y = y)] # rename to ball.y for easier joining later

tracking.DT <- merge(tracking.DT, ball.coordinates, by = c("gameId", "playId", "frameId"))
rm(ball.coordinates)

# ball carrier coordinates
ball.carriers <- plays.DT[, .(gameId, playId, ballCarrierId)]

tracking.DT[, distance_from_ball := sqrt((x-ball.x)^2 + (y-ball.y)^2)]
