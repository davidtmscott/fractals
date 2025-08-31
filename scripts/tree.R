#!/usr/bin/env Rscript

# ============================================================
# Script Name: tree.R
# Description: Creates a tree like fractal using recursion 
# Author: David Scott
# Created: 2018-01-29
#
# Usage:
#   Rscript scripts/tree.R
#
# Dependencies:
#   - base R (no external packages required)
#   - R/helpers.R (for turtle function)
#
# Output:
#   - ../outputs/tree.png
# ============================================================


# load helper function
source("../R/helpers.R")

# recursively calls itself twice, each with a different adjustment of angle
# one calls 45 degrees to the left
# other calls 45 degrees to the right

tree <- function(start_position, direction, length){
  # threshold
  e = 0.5
  # calls turtle to draw line
  start_position <- turtle(start_position, direction, length)
  # adjust length
  length = length * 0.65
  if (length > e){
    # calls again but adjusts angle to the left (45 degrees)
    tree(start_position, (direction - pi/4), length)
    # 45 degrees to the right
    tree(start_position, (direction + pi/4), length)
  } 
}

# plot
png("../outputs/tree.png", width = 400, height = 400)
plot(-300, 300, axes = F, xlab = NA, ylab = NA, cex = 0.001)
tree(start_position = c(-310, 200), direction = pi/2, length = 75)
dev.off()
