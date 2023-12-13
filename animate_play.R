library(ggplot2)
library(sportyR)
library(gganimate)

# Function
animate_play <- function(tracking_data_for_single_play) {
  
  tracking_data_for_single_play <- as.data.table(tracking_data_for_single_play)
  # TEMPORARY
  #tracking_data_for_single_play <- tracking.DT[gameId == 2022100208 & playId == 1303]
  
  # unique teams in play
  #teams.in.play <- unique(tracking_data_for_single_play[club != "football", club])
  
  # Create the field
  nfl_field <- geom_football("nfl", x_trans = 60, y_trans = 26.67)
  
  # Display the field
  #nfl_field
  
  tracking_data_for_single_play[is.na(nflId), nflId := 0]
  
  # assign colors
  tracking_data_for_single_play[, color := ifelse(club == "football", "#000000",
                                              ifelse(nflId == ballCarrierId, "red",
                                                ifelse(should_be_tackle == 1, "white",
                                                  ifelse(Off_or_Def == "Defense", "#0096FF", "#FFEA00"))))]
  
  # assign sizes
  tracking_data_for_single_play[, dot_size := ifelse(should_be_tackle == 1 | nflId == ballCarrierId, 2, 1.5)]
  
  play_anim <- nfl_field +
    geom_point(
      data = tracking_data_for_single_play,
      aes(x, y, size = dot_size),
      #size = tracking_data_for_single_play$dot_size,
      color = tracking_data_for_single_play$color
    ) +
    guides(size = FALSE) +  # Remove the size legend
    transition_time(tracking_data_for_single_play$frameId)
  
  # # select duration in seconds
  # my.duration <- 2
  # my.frame.ct <- length(unique(tracking_data_for_single_play$frameId))
  # 
  # play_anim <- animate(play_anim,
  #                      nframes = my.frame.ct,
  #                      fps = my.duration/my.frame.ct)
  
  # Return the animation
  return(play_anim)
}

# example
animate_play(tracking.DT[gameId == 2022091812 & playId == 1353])
