calc_cell_daily_mins <- function(x, returnDF = F, factorName = ""){
  s <- seq(0, by = 24, length.out = 12)
  e <- seq(24, by = 24, length.out = 12)
  
  cell_daily_mins <- list(1)
  for(i in 1:12){
    day <- subset(x, tstep >= s[i] & tstep < e[i])
    cell_mins <- aggregate(x = day$temp,
                            by = list(day$idx),
                            FUN = min)
    colnames(cell_mins) <- c("idx", "min_temp")
    cell_daily_mins[[i]] <- cell_mins$min_temp
  }
  
  cell_daily_mins_df <- data.frame(temp = unlist(cell_daily_mins),
                                    dateIDX = rep(1:12, each = length(cell_daily_mins[[1]])),
                                    group = as.factor(factorName))
  if(returnDF){
    return(cell_daily_mins_df)
  }else{
    return(cell_daily_mins)
  }
}