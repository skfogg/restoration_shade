load_well_line <- function(file){
  skips <- seq(10,by = 8, length.out = 287)
  
  t1 <- read.csv(file,
                 skip = 2, nrows = 6, col.names = c("x", "y", "z", "head", "p_head", "sat", "depth2gwt", "temp", "tstep"),
                 header = F)
  t1$tstep <- 1
  t1$zidx <- 0:5
  
  well_temps <- t1
  for(i in 1:length(skips)){
    this_time <- read.csv(file,
                          skip = skips[i], nrows = 6, col.names = c("x", "y", "z", "head", "p_head", "sat", "depth2gwt", "temp", "tstep"),
                          header = F)
    this_time$tstep <- i+1
    this_time$zidx <- 0:5
    well_temps <- rbind(well_temps, this_time)
  }
  return(well_temps)
}