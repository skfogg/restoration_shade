get_spatial_points_list <- function(x){
  x_temps <- list(1)
  for(i in 1:length(time_steps)){
    all <- subset(all_stream, tstep == time_steps[i])
    
    x_temps[[i]] <- SpatialPointsDataFrame(x[,c("x", "y")], data.frame(temp = x[,"temp"]))
  }
  return(x_temps)
}