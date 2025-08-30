#!/usr/bin/env Rscript

# ============================================================
# File: helpers.R
# Description: Shared helper functions for fractals scripts
# Author: David Scott
# Created: 2018-08-30
# Last Updated: 2025-08-30
# ============================================================

# function to take a start point, 
# draw a line of a pre defined length and angle 
# return end point

# direction measured in radians
turtle <- function(start_position, direction, length){
  # creates end point coordinates based on given parameters
  y = (sin(direction) * (length)) + start_position[2]
  x = (cos(direction) * (length)) + start_position[1]
  # assigns them to a variable to be returned
  EndPoint = c(x, y)
  # plots the line between startpoint and end points
  segments(start_position[1], start_position[2], EndPoint[1], EndPoint[2], lwd = 1.5)
  return(EndPoint)
}

#plot(0,0)
#turtle(start_position = c(0,0), direction = pi/2, length = 5)
