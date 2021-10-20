# binomial

x_values <- 0:100

# Now we produce an empty plot.
plot(
  x = x_values,
  ylim = c(0, 0.1), # With ylim you can adjust the limits of the y axis.
  type = "n",       # type "n" produces an empty plot window.
  main = "PMF for X ~ Binomial (n = 100, p = 0.5)",
  xlab = "x",
  ylab = "p(x)",
  las = 1,
  frame = F,
  axes = F
)
axis(1, seq(0,100,5), labels = seq(0,100,5))
axis(2, seq(0, 0.1,0.02), las = 1)
# Let's add the points.
points(x_values, 
       dbinom(x_values, size = 100, p = 0.5), 
       cex = 0.3, 
       pch = 19, 
       # col = viridis(1)
)

segments(x0 = x_values, 
         y0 = 0, 
         x1 = x_values, 
         y1 = dbinom(x_values, size = 100, p = 0.5), 
         col = "grey80"
)

## pbinom
# And those lines we know from the lecture.
segments(x0 = x_values[1:56], 
         y0 = 0, 
         x1 = x_values[1:56], 
         y1 = dbinom(x_values[1:56], size = 100, p = 0.5), 
         col = viridis(4)[1]
) 
arrows(
  48,
  .05,
  30,
  .07,
  code = 1,
  angle = 45,
  length = .1,
  lwd = 2,
  col = viridis(3)[1]
)
text(x = 30,
     y = 0.07,
     paste('P(X <= 55) =', '\npbinom(55, 100, 0.5) =\n',
           'dbinom(0, 100, 0.5) + dbinom(1, 100, 0.5) +\n... + dbinom(55, 100, 0.5) =',
           round(pbinom(55, 100, 0.5), 3)),
     pos = 3,
     cex = .85)
#dbinom
points(55, 
       dbinom(55, size = 100, p = 0.5), 
       cex = 1, 
       pch = 19, 
       col = viridis(4)[2]
)
arrows(
  55,
  dbinom(55, 100, 0.5),
  65,
  .07,
  code = 1,
  angle = 45,
  length = .1,
  lwd = 2,
  col = viridis(4)[2]
)
text(x = 65,
     y = 0.07,
     paste('p(X=55) =\ndbinom(55, 100, 0.5) =', round(dbinom(55, 100, 0.5), 3)),
     pos = 3,
     cex = .85)
abline(h = dbinom(55, 100, 0.5),
       col = viridis(4)[2],
       lwd = 0.5,
       lty = 2)

axis(2, at = dbinom(55, 100, 0.5), labels = round(dbinom(55, 100, 0.5), 3),
     las = 1, lwd = 0.5)

# qbinom 
points(55, 
       0, 
       cex = 1, 
       pch = 19, 
       col = viridis(4)[3]
)
arrows(
  55,
  0,
  65,
  .02,
  code = 1,
  angle = 45,
  length = .1,
  lwd = 2,
  col = viridis(4)[3]
)
text(x = 69,
     y = 0.02,
     paste('86.4th quantile =\nqbinom(0.86, 100, 0.5) =', round(qbinom(0.864, 100, 0.5), 3)),
     pos = 3,
     cex = .85)


# rbinom
par(xpd = T)
points(rbinom(30, 100, 0.5),
       jitter(rep(0, 30), factor = 0.5),
       pch = 19,
       cex = .6,
       col = viridis::viridis(4)[4])
arrows(
  45,
  .01,
  27,
  .03,
  code = 1,
  angle = 30,
  length = .1,
  lwd = 2,
  col = viridis::viridis(4)[4]
)
text(  27,
       .03,
       'rbinom(30, 100, 0.5)',
       # col = viridis::viridis(4)[4],
       cex = .85,
       pos = 3)
par(xpd = F)