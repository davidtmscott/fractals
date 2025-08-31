#!/usr/bin/env Rscript

# load helper function
source("../R/helpers.R")

fern <- function(start_position, direction, length, dir){
  # threshold
  e = 0.25
  # draw line
  start_position <- turtle(start_position, direction, length)
  if (length > e){
    # adjust dir
    dir = dir * -1
    # calls its self but dir decides left or right
    fern(start_position, (direction + (pi/4 * dir)), (length * 0.39), -dir) #0.38
    # straight on
    fern(start_position, direction, (length * 0.88), dir) #0.87
  } 
}


plot(-600, 600,axes = F, xlab = NA, ylab = NA, cex = 0.001)
fern(start_position = c(-625, 350), direction = pi/2, length = 60, dir = -1)
