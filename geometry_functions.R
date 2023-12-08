angle_relative_to_point <- function(x_defender, y_defender, angle_defender, x_receiver = 0, y_receiver = 0) {
  
  x_relative <- x_defender - x_receiver
  y_relative <- y_defender - y_receiver
  
  angle.from.receiver <- atan2(y_relative, x_relative) * 180 / pi
  # put in terms of field angles
  #angle.from.receiver <- ifelse(angle.from.receiver < 0, 180 + 180 - abs(angle.from.receiver), angle.from.receiver)
  
  # inside triangle angle
  inside.tri.angle <- ifelse(x_relative <= 0 & y_relative >= 0, 180 - angle.from.receiver, # top-left quadrant
                         ifelse(x_relative > 0 & y_relative >= 0, angle.from.receiver, #top-right quadrant
                         ifelse(x_relative > 0 & y_relative < 0, abs(angle.from.receiver), #bottom-right quadrant
                                180 - abs(angle.from.receiver))))
  
  # outside angle
  outside.tri.angle <- 90 - inside.tri.angle
  
  # angle difference
  angle.difference <- ifelse(x_relative <= 0 & y_relative >= 0, angle_defender - 180 + outside.tri.angle, # top-left quadrant
                             ifelse(x_relative > 0 & y_relative >= 0, 180 - angle_defender + outside.tri.angle, #top-right quadrant
                                    ifelse(x_relative > 0 & y_relative < 0, 90 - outside.tri.angle + 270 - angle_defender, #bottom-right quadrant
                                           outside.tri.angle + 360 - angle_defender)))
  
  # no greater than 180
  angle.difference <- abs(ifelse(angle.difference > 180, 180 - (angle.difference - 180), angle.difference))
  
  return(angle.difference)
  
}

angle_relative_to_point(-10, 11, 170, 0, 0)
angle_relative_to_point(3, 7, 150, 0, 0)
angle_relative_to_point(6, -2, 230, 0, 0)
angle_relative_to_point(-7, -3, 230, 0, 0)
angle_relative_to_point(5, -5, 125, 0, 0)

test.angles <- 1:360
test.angles <- as.data.frame(cbind(5, -5, test.angles))
test.angles$diff <- angle_relative_to_point(test.angles$V1, test.angles$V2, test.angles$test.angles)
plot(test.angles$test.angles, test.angles$diff)

is_point_within_radius <- function(x_test, y_test, x_mid = 0, y_mid = 0, radius = 1) {
  radius_test <- sqrt((x_mid - x_test)^2 + (y_mid - y_test)^2) / 2
  
  return(radius_test <= radius)
}

is_point_within_radius(3, 4, 0, 0, 5)








