calc_cell_daily_means <- function(x, returnDF = F, factorName = ""){

  s <- seq(0, by = 24, length.out = 12)
  e <- seq(24, by = 24, length.out = 12)
  
  cell_daily_means <- list(1)
  for(i in 1:12){
    day <- subset(x, tstep >= s[i] & tstep < e[i])
    cell_means <- aggregate(x = day$temp,
                            by = list(day$idx),
                            FUN = mean)
    colnames(cell_means) <- c("idx", "mean_temp")
    cell_daily_means[[i]] <- cell_means$mean_temp
  }
 
  
  cell_daily_means_df <- data.frame(temp = cell_daily_means[[1]],
                                    dateIDX = rep(1, times = length(cell_daily_means[[1]])),
                                    group = as.factor(factorName))
  for(i in 2:12){
    cell_daily_means_df <- rbind(cell_daily_means_df, data.frame(temp = cell_daily_means[[i]],
                                                                dateIDX = rep(i, each = length(cell_daily_means[[i]])),
                                                                group = as.factor(factorName)))
  }

  if(returnDF){
    return(cell_daily_means_df)
  }else{
    return(cell_daily_means)
  }
}