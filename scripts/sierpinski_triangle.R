#!/usr/bin/env Rscript

# ============================================================
# Script Name: sierpinski.R
# Description: Creates Sierpinski triangle through iterations of a simple rule
# Author: David Scott
# Created: 2018-01-29
#
# Usage:
#   Rscript scripts/sierpinski_triangle.R
#
# Dependencies:
#   - base R (no external packages required)
#
# Output:
#   - 
# ============================================================

# create Sierpinski triangle (gasket) through iterations of a simple rule

chaos_game <- function(){
  # create data frame of three initial points
  #df <- data.frame(letter = c("A", "B", "C"), x = c(0, 3, 4), y = c(0, 4, 1))
  df <- data.frame(letter = c("A", "B", "C"), x = c(0, 2, 4), y = c(0, 4, 0))
  # plot points on a graph
  plot(df$x, df$y, xlab = "X", ylab = "Y")
  # initialize point vector X
  Xpoint = xy.coords(0,0)
  # plot the point as an "x"
  points(Xpoint, pch = 4, cex = 0.5)
  for (i in 1:10000){
    # randomly sample three points in data frame (A, B, C)
    rowsamp <- df[sample(nrow(df), 1), ]
    # one point x halfway towards the sampled point
    x <- (rowsamp$x + Xpoint$x) / 2
    y <- (rowsamp$y + Xpoint$y) / 2
    # update location of X point
    Xpoint <- xy.coords(x, y)
    # replot in new location
    points(Xpoint, pch = 4, cex = 0.5)
  }
}

chaos_game()
