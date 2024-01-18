##
## PROCESS BYRON WELLS
##

library(stringr)
library(xts)
library(zoo)
library(lubridate)

source("scripts/functions/get_well_mean_max_min.R")

byron_well_file_names <- paste0("byron_well_", c(1:14, 17:21), ".csv")
# byron_well_flow_file_names <- paste0("byron_well_", c(1:14, 17:21), "_flow.csv")
file_path <- "C:\\Users\\skati\\OneDrive - Montana State University\\Chapter_3\\"

pre_folder <- "pre_higher_res\\"
post_folder <- "post_higher_res\\"

t_folder <- "transient_hydro\\data_results\\"
ss_folder <- "steady_state_hydro\\data_results\\"

########################
#### PRE: TRANSIENT ####
########################
pre_t_byron <- mapply(function(x) read.csv(paste0(file_path, 
                                                  pre_folder, 
                                                  t_folder, x), col.names = c("time", "temp", "trash","x", "y", "z", "zsurf", "trash", "trash"))[,c(-3,-8,-9)],
                        byron_well_file_names,
                        SIMPLIFY = F)
saveRDS(pre_t_byron, "r_objects/pre_t_byron.R")

pre_t_byron_ts <- mapply(function(x) xts(zoo(x$temp, order.by = mdy_hms("01-01-2008 00:00:00")+ x$time)),
                           pre_t_byron,
                           SIMPLIFY = F)
saveRDS(pre_t_byron_ts, "r_objects/pre_t_byron_ts.R")

pre_t_byron_mean_well <- get_well_means(pre_t_byron, wellidx = 6:19)
saveRDS(pre_t_byron_mean_well, "r_objects/pre_t_byron_mean_well.R")

pre_t_byron_min_well <- get_well_mins(pre_t_byron, wellidx = 6:19)
saveRDS(pre_t_byron_min_well, "r_objects/pre_t_byron_min_well.R")

pre_t_byron_max_well <- get_well_maxs(pre_t_byron, wellidx = 6:19)
saveRDS(pre_t_byron_max_well, "r_objects/pre_t_byron_max_well.R")

# # FLOW #
# all_sun_byron_flow <- mapply(function(x) read.csv(paste0(file_path, "all_sun\\", model_folder, x), col.names = c("head", "pressure_head", "saturation","x", "y", "z", "zsurf", "elem", "trash"))[,1:8],
#                              byron_well_flow_file_names,
#                              SIMPLIFY = F)


###########################
#### PRE:STEADY STATE  ####
###########################
pre_ss_byron <- mapply(function(x) read.csv(paste0(file_path, 
                                                  pre_folder, 
                                                  ss_folder, x), col.names = c("time", "temp", "trash","x", "y", "z", "zsurf", "trash", "trash"))[,c(-3,-8,-9)],
                      byron_well_file_names,
                      SIMPLIFY = F)
saveRDS(pre_ss_byron, "r_objects/pre_ss_byron.R")

pre_ss_byron_ts <- mapply(function(x) xts(zoo(x$temp, order.by = mdy_hms("01-01-2008 00:00:00")+ x$time)),
                         pre_ss_byron,
                         SIMPLIFY = F)
saveRDS(pre_ss_byron_ts, "r_objects/pre_ss_byron_ts.R")

pre_ss_byron_mean_well <- get_well_means(pre_ss_byron, wellidx = 6:19)
saveRDS(pre_ss_byron_mean_well, "r_objects/pre_ss_byron_mean_well.R")

pre_ss_byron_min_well <- get_well_mins(pre_ss_byron, wellidx = 6:19)
saveRDS(pre_ss_byron_min_well, "r_objects/pre_ss_byron_min_well.R")

pre_ss_byron_max_well <- get_well_maxs(pre_ss_byron, wellidx = 6:19)
saveRDS(pre_ss_byron_max_well, "r_objects/pre_ss_byron_max_well.R")



#########################
#### POST: TRANSIENT ####
#########################
post_t_byron <- mapply(function(x) read.csv(paste0(file_path, 
                                                  post_folder, 
                                                  t_folder, x), col.names = c("time", "temp", "trash","x", "y", "z", "zsurf", "trash", "trash"))[,c(-3,-8,-9)],
                      byron_well_file_names,
                      SIMPLIFY = F)
saveRDS(post_t_byron, "r_objects/post_t_byron.R")

post_t_byron_ts <- mapply(function(x) xts(zoo(x$temp, order.by = mdy_hms("01-01-2008 00:00:00")+ x$time)),
                         post_t_byron,
                         SIMPLIFY = F)
saveRDS(post_t_byron_ts, "r_objects/post_t_byron_ts.R")

post_t_byron_mean_well <- get_well_means(post_t_byron, wellidx = 6:19)
saveRDS(post_t_byron_mean_well, "r_objects/post_t_byron_mean_well.R")

post_t_byron_mean_well_all <- get_well_means(post_t_byron, wellidx = 1:19)

post_t_byron_median_well <- get_well_medians(post_t_byron, wellidx = 1:19)



post_t_byron_min_well <- get_well_mins(post_t_byron, wellidx = 6:19)
saveRDS(post_t_byron_min_well, "r_objects/post_t_byron_min_well.R")

post_t_byron_max_well <- get_well_maxs(post_t_byron, wellidx = 6:19)
saveRDS(post_t_byron_max_well, "r_objects/post_t_byron_max_well.R")

############################
#### POST: STEADY STATE ####
############################
post_ss_byron <- mapply(function(x) read.csv(paste0(file_path, 
                                                   post_folder, 
                                                   ss_folder, x), col.names = c("time", "temp", "trash","x", "y", "z", "zsurf", "trash", "trash"))[,c(-3,-8,-9)],
                       byron_well_file_names,
                       SIMPLIFY = F)
saveRDS(post_ss_byron, "r_objects/post_ss_byron.R")

post_ss_byron_ts <- mapply(function(x) xts(zoo(x$temp, order.by = mdy_hms("01-01-2008 00:00:00")+ x$time)),
                          post_ss_byron,
                          SIMPLIFY = F)
saveRDS(post_ss_byron_ts, "r_objects/post_ss_byron_ts.R")

post_ss_byron_mean_well <- get_well_means(post_ss_byron, wellidx = 6:19)
saveRDS(post_ss_byron_mean_well, "r_objects/post_ss_byron_mean_well.R")

post_ss_byron_min_well <- get_well_mins(post_ss_byron, wellidx = 6:19)
saveRDS(post_ss_byron_min_well, "r_objects/post_ss_byron_min_well.R")

post_ss_byron_max_well <- get_well_maxs(post_ss_byron, wellidx = 6:19)
saveRDS(post_ss_byron_max_well, "r_objects/post_ss_byron_max_well.R")


##################################
#### POST: TRANSIENT: LOW RES ####
##################################
post_t_lr_byron <- mapply(function(x) read.csv(paste0(file_path, 
                                                   "post\\", 
                                                   t_folder, x), col.names = c("time", "temp", "trash","x", "y", "z", "zsurf", "trash", "trash"))[,c(-3,-8,-9)],
                       byron_well_file_names,
                       SIMPLIFY = F)
saveRDS(post_t_lr_byron, "r_objects/post_t_lr_byron.R")

post_t_lr_byron_ts <- mapply(function(x) xts(zoo(x$temp, order.by = mdy_hms("01-01-2008 00:00:00")+ x$time)),
                          post_t_lr_byron,
                          SIMPLIFY = F)
saveRDS(post_t_lr_byron_ts, "r_objects/post_t_lr_byron_ts.R")

post_t_lr_byron_mean_well <- get_well_means(post_t_lr_byron, wellidx = 6:19)
saveRDS(post_t_lr_byron_mean_well, "r_objects/post_t_lr_byron_mean_well.R")

post_t_lr_byron_min_well <- get_well_mins(post_t_lr_byron, wellidx = 6:19)
saveRDS(post_t_lr_byron_min_well, "r_objects/post_t_lr_byron_min_well.R")

post_t_lr_byron_max_well <- get_well_maxs(post_t_lr_byron, wellidx = 6:19)
saveRDS(post_t_lr_byron_max_well, "r_objects/post_t_lr_byron_max_well.R")

