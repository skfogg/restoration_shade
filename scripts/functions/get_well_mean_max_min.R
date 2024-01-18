get_well_means <- function(x, wellidx = 6:19){
  x_df <- data.frame(temp = x[[wellidx[1]]]$temp)
  for(i in wellidx[2]:last(wellidx)){
    x_df <- cbind(x_df, x[[i]]$temp)
  }
  colnames(x_df) <- paste0("well", wellidx)
  x_mean_well <- xts(zoo(rowMeans(x_df), order.by = mdy_hms("01-01-2012 00:00:00") + x[[1]]$time))
  return(x_mean_well)
}

get_well_mins <- function(x, wellidx = 6:19){
  x_df <- data.frame(temp = x[[wellidx[1]]]$temp)
  for(i in wellidx[2]:last(wellidx)){
    x_df <- cbind(x_df, x[[i]]$temp)
  }
  colnames(x_df) <- paste0("well", wellidx)
  x_min_well <- xts(zoo(apply(x_df, 1, min), order.by = mdy_hms("01-01-2012 00:00:00") + x[[1]]$time))
  return(x_min_well)
}

get_well_maxs <- function(x, wellidx = 6:19){
  x_df <- data.frame(temp = x[[wellidx[1]]]$temp)
  for(i in wellidx[2]:last(wellidx)){
    x_df <- cbind(x_df, x[[i]]$temp)
  }
  colnames(x_df) <- paste0("well", wellidx)
  x_max_well <- xts(zoo(apply(x_df, 1, max), order.by = mdy_hms("01-01-2012 00:00:00") + x[[1]]$time))
  return(x_max_well)
}

get_well_medians <- function(x, wellidx = 6:19){
  x_df <- data.frame(temp = x[[wellidx[1]]]$temp)
  for(i in wellidx[2]:last(wellidx)){
    x_df <- cbind(x_df, x[[i]]$temp)
  }
  colnames(x_df) <- paste0("well", wellidx)
  x_median_well <- xts(zoo(apply(x_df, 1, median), order.by = mdy_hms("01-01-2012 00:00:00") + x[[1]]$time))
  return(x_median_well)
}
