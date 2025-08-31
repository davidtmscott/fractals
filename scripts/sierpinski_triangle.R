#!/usr/bin/env Rscript

# ============================================================
# Script Name: sierpinski_triangle.R
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
#   - ../outputs/sierpinski_triangle.png
# ============================================================

# create Sierpinski triangle (gasket) through iterations of a simple rule

chaos_game <- function(n){
  # create data frame of three initial points
  df <- data.frame(letter = c("A", "B", "C"), x = c(0, 2, 4), y = c(0, 4, 0))
  
  # plot points on a graph
  #plot(df$x, df$y, xlab = "X", ylab = "Y")
  
  # initialize point vector X
  Xpoint = xy.coords(0,0)
  
  # plot the point as an "x"
  #points(Xpoint, pch = 4, cex = 0.5)
  
  # prepare storage for all points
  points_df <- data.frame(x = numeric(n), y = numeric(n))
  
  for (i in 1:n){
    # randomly sample three points in data frame (A, B, C)
    rowsamp <- df[sample(nrow(df), 1), ]
    # one point x halfway towards the sampled point
    x <- (rowsamp$x + Xpoint$x) / 2
    y <- (rowsamp$y + Xpoint$y) / 2
    # update location of X point
    Xpoint <- xy.coords(x, y)
    
    # replot in new location
    #points(Xpoint, pch = 4, cex = 0.5)
    
    points_df[i, ] <- c(x, y)
  }
  # return the coordinates as an object
  return(points_df)
}

df <- chaos_game(n=10000)

# plot
png("../outputs/sierpinski_triangle.png", width = 400, height = 400)
plot(df, pch = 4, cex = 0.5)
dev.off()
