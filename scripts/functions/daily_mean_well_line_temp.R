daily_mean_well_line_temp <- function(well_temps){
  s <- seq(0, by = 24, length.out = 12)
  e <- seq(24, by = 24, length.out = 12)
  
  jdays <- c(1, 31, 61, 91, 121, 151, 181, 211, 241, 271, 301, 331)
  
  mean_well <- list(0)
  for(i in 1:12){
    mean_well[[i]] <- data.frame(temp = c(mean(c(subset(well_temps, zidx == 0)$temp[s[i]:e[i]])), 
                                          mean(c(subset(well_temps, zidx == 1)$temp[s[i]:e[i]])),
                                          mean(c(subset(well_temps, zidx == 2)$temp[s[i]:e[i]])),
                                          mean(c(subset(well_temps, zidx == 3)$temp[s[i]:e[i]])),
                                          mean(c(subset(well_temps, zidx == 4)$temp[s[i]:e[i]])),
                                          mean(c(subset(well_temps, zidx == 5)$temp[s[i]:e[i]]))),
                                 zidx = 0:5,
                                 day = jdays[i]
    )
  }
  mean_well <- do.call(rbind, mean_well)
  return(mean_well)
}


