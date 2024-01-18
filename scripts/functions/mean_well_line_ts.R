mean_well_line_ts <-function(mean_well){
  require(lubridate)
  require(zoo)
  require(xts)
  
  outputtimes <- read.table("output_9th_year.txt")
  times <- ymd_hms("2013-01-01 00:00:00") + (outputtimes[,1]-outputtimes[1,1])[seq(1, by = 24, length.out = 12)]
  
  mean_well_ts <- list(0)
  for(i in 1:6){
    mean_well_ts[[i]] <- xts(zoo(c(subset(mean_well, zidx == i-1)$temp, subset(mean_well, zidx == i-1)$temp), order.by = c(times, times + (365*86400) +86400)))
  }
  
  all_depths <- do.call(cbind, mean_well_ts)
  colnames(all_depths) <- c("z0", "z1", "z2", "z3", "z4", "z5")
  
  return(all_depths)
}