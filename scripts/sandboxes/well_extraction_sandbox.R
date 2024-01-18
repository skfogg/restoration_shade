##
## WELL EXTRACTION
##

outputtimes <- read.table("output_9th_year.txt")
times <- ymd_hms("2013-01-01 00:00:00") + (outputtimes[,1]-outputtimes[1,1])[seq(1, by = 24, length.out = 12)]
jdays <- round(julian(times, origin = "2019-12-31"), 0)



#c(10,18,26)/8 - 0.25

skips <- seq(10,by = 8, length.out = 287)

t1 <- read.csv("C:\\Users\\skati\\OneDrive - Montana State University\\Chapter_3\\post_higher_res\\transient_hydro\\data_results\\well_extraction_post_t_well_17.csv",
         skip = 2, nrows = 6, col.names = c("x", "y", "z", "head", "p_head", "sat", "depth2gwt", "temp", "tstep"),
         header = F)
t1$tstep <- 1
t1$zidx <- 0:5

well_temps <- t1
for(i in 1:length(skips)){
  this_time <- read.csv("C:\\Users\\skati\\OneDrive - Montana State University\\Chapter_3\\post_higher_res\\transient_hydro\\data_results\\well_extraction_post_t_well_17.csv",
                        skip = skips[i], nrows = 6, col.names = c("x", "y", "z", "head", "p_head", "sat", "depth2gwt", "temp", "tstep"),
                        header = F)
  this_time$tstep <- i+1
  this_time$zidx <- 0:5
  well_temps <- rbind(well_temps, this_time)
}

head(well_temps,50)

s <- seq(0, by = 24, length.out = 12)
e <- seq(24, by = 24, length.out = 12)

mean_well <- list(0)
for(i in 1:12){
  mean_well[[i]] <- data.frame(temp = c(mean(c(subset(well_temps, zidx == 0)$temp[s[i]:e[i]])), 
                                        mean(c(subset(well_temps, zidx == 1)$temp[s[i]:e[i]])),
                                        mean(c(subset(well_temps, zidx == 2)$temp[s[i]:e[i]])),
                                        mean(c(subset(well_temps, zidx == 3)$temp[s[i]:e[i]])),
                                        mean(c(subset(well_temps, zidx == 4)$temp[s[i]:e[i]])),
                                        mean(c(subset(well_temps, zidx == 5)$temp[s[i]:e[i]]))),
                               zidx = 0:5,
                               day = jdays[[i]]
  )
}
mean_well <- do.call(rbind, mean_well)


ymd_hms("2013-01-01 00:00:00") + (outputtimes[,1] - outputtimes[1,1])



plot(subset(well_temps, zidx == 0)$temp)
points(subset(well_temps, zidx == 1)$temp)
points(subset(well_temps, zidx == 2)$temp)
points(subset(well_temps, zidx == 3)$temp)
points(subset(well_temps, zidx == 4)$temp)
points(subset(well_temps, zidx == 5)$temp)


plot(subset(mean_well, zidx == 0)$temp, type = "l")
lines(subset(mean_well, zidx == 1)$temp)
lines(subset(mean_well, zidx == 2)$temp)
lines(subset(mean_well, zidx == 3)$temp)
lines(subset(mean_well, zidx == 4)$temp)
lines(subset(mean_well, zidx == 5)$temp)


mean_well_ts <- list(0)
for(i in 1:6){
  mean_well_ts[[i]] <- xts(zoo(c(subset(mean_well, zidx == i-1)$temp, subset(mean_well, zidx == i-1)$temp), order.by = c(times, times + (365*86400) +86400)))
}

all_depths <- do.call(cbind, mean_well_ts)
colnames(all_depths) <- c("z0", "z1", "z2", "z3", "z4", "z5")

hz_mean <- xts(zoo(rowMeans(all_depths[,c("z1", "z2", "z3")]), order.by = c(times, times + (365*86400) +86400)))



plot.zoo(mean_well_ts[[1]], col = "red", type = "l")
mapply(function(x,c) lines(as.zoo(x), col = c),
       x = mean_well_ts,
       c = hcl.colors(7)[2:7])
lines(as.zoo(post_t_byron_ts[["byron_well_17.csv"]]["2013/2014"]),
      lty = 2)

lines(as.zoo(as.xts(goodWellsZoo[,paste0("well", 17)])), col = "red", lwd = 2)
lines(as.zoo(hz_mean), col = "blue", lwd = 2)




plot(wellTempDF$Index, wellTempDF$well17,
     type = "l")



well_temps[1:6,c("z","zidx", "temp")]
