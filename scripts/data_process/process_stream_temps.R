##
## PROCESS RESULTS: STREAM TEMPERATURES
##
## Daily mean cell temp
## Spatial points lists 
## Raster lists of daily mean cell temp

library(raster)
library(sp)
source("scripts/functions/calc_cell_daily_means.R")
source("scripts/functions/calc_cell_daily_mins.R")
source("scripts/functions/calc_cell_daily_maxs.R")
source('scripts/functions/get_spatial_points_list.R')

blank_raster <- raster(ncol = 51, nrow = 319, xmn = 394109, xmx = 394364, ymn = 5053203, ymx = 5054798)

file_path <- "C:\\Users\\skati\\OneDrive - Montana State University\\Chapter_3\\"

pre_folder <- "pre_higher_res\\"
post_folder <- "post_higher_res\\"

t_folder <- "transient_hydro\\data_results\\"
ss_folder <- "steady_state_hydro\\data_results\\"


####################
#### PRE; T; HR ####
####################
pre_t_stream <- read.csv(paste0(file_path, 
                                pre_folder,
                                t_folder,
                                "stream_temps_pre_t.csv"),
                         skip = 1,
                         col.names = c("idx", "temp", "x", "y", "z", "tstep", "cellarea", "depth"))
saveRDS(pre_t_stream, "r_objects/pre_t_stream.R")

cell_daily_means_pre_t <- calc_cell_daily_means(pre_t_stream)
saveRDS(cell_daily_means_pre_t, "r_objects/cell_daily_means_pre_t.R")

cell_daily_means_pre_t_df <- calc_cell_daily_means(pre_t_stream, returnDF = T, factorName = "pre_t")
saveRDS(cell_daily_means_pre_t_df, "r_objects/cell_daily_means_pre_t_df.R")

cell_daily_mins_all <- calc_cell_daily_mins(all_stream)
saveRDS(cell_daily_mins_all, "r_objects/cell_daily_mins_all.R")

cell_daily_maxs_all <- calc_cell_daily_maxs(all_stream)
saveRDS(cell_daily_maxs_all, "r_objects/cell_daily_maxs_all.R")


# all_stream_temps <- get_spatial_points_list(all_stream)

all_r <- mapply(function(x) rasterize(SpatialPointsDataFrame(all_stream[all_stream$tstep == 0, c('x', 'y')], data = data.frame(temps = x)), blank_raster),
                cell_daily_means_all,
                SIMPLIFY = F)
saveRDS(all_r, "r_objects/all_r.R")

all_r_max <- mapply(function(x) rasterize(SpatialPointsDataFrame(all_stream[all_stream$tstep == 0, c('x', 'y')], data = data.frame(temps = x)), blank_raster),
                cell_daily_maxs_all,
                SIMPLIFY = F)
saveRDS(all_r_max, "r_objects/all_r_max.R")

all_r_min <- mapply(function(x) rasterize(SpatialPointsDataFrame(all_stream[all_stream$tstep == 0, c('x', 'y')], data = data.frame(temps = x)), blank_raster),
                    cell_daily_mins_all,
                    SIMPLIFY = F)
saveRDS(all_r_min, "r_objects/all_r_min.R")


#####################
#### PRE; SS; HR ####
#####################
pre_ss_stream <- read.csv(paste0(file_path, 
                                pre_folder,
                                ss_folder,
                                "stream_temps_pre_ss.csv"),
                         skip = 1,
                         col.names = c("idx", "temp", "x", "y", "z", "tstep", "cellarea", "depth"))
saveRDS(pre_ss_stream, "r_objects/pre_ss_stream.R")

cell_daily_means_pre_ss <- calc_cell_daily_means(pre_ss_stream)
saveRDS(cell_daily_means_pre_ss, "r_objects/cell_daily_means_pre_ss.R")

cell_daily_means_pre_ss_df <- calc_cell_daily_means(pre_ss_stream, returnDF = T, factorName = "pre_ss")
saveRDS(cell_daily_means_pre_ss_df, "r_objects/cell_daily_means_pre_ss_df.R")

cell_daily_mins_fifty <- calc_cell_daily_mins(fifty_stream)
saveRDS(cell_daily_mins_fifty, "r_objects/cell_daily_mins_fifty.R")

cell_daily_maxs_fifty <- calc_cell_daily_maxs(fifty_stream)
saveRDS(cell_daily_maxs_fifty, "r_objects/cell_daily_maxs_fifty.R")


# fifty_stream_temps <- get_spatial_points_list(fifty_stream)

fifty_r <- mapply(function(x) rasterize(SpatialPointsDataFrame(fifty_stream[fifty_stream$tstep == 0, c('x', 'y')], data = data.frame(temps = x)), blank_raster),
                  cell_daily_means_fifty,
                  SIMPLIFY = F)
saveRDS(fifty_r, "r_objects/fifty_r.R")

fifty_r_max <- mapply(function(x) rasterize(SpatialPointsDataFrame(fifty_stream[fifty_stream$tstep == 0, c('x', 'y')], data = data.frame(temps = x)), blank_raster),
                    cell_daily_maxs_fifty,
                    SIMPLIFY = F)
saveRDS(fifty_r_max, "r_objects/fifty_r_max.R")

fifty_r_min <- mapply(function(x) rasterize(SpatialPointsDataFrame(fifty_stream[fifty_stream$tstep == 0, c('x', 'y')], data = data.frame(temps = x)), blank_raster),
                    cell_daily_mins_fifty,
                    SIMPLIFY = F)
saveRDS(fifty_r_min, "r_objects/fifty_r_min.R")

#####################
#### POST; T; HR ####
#####################
post_t_stream <- read.csv(paste0(file_path, 
                                 post_folder,
                                 t_folder,
                                 "stream_temps_post_t.csv"),
                         skip = 1,
                         col.names = c("idx", "temp", "x", "y", "z", "tstep", "cellarea", "depth"))
saveRDS(post_t_stream, "r_objects/post_t_stream.R")

cell_daily_means_fiftyi <- calc_cell_daily_means(fiftyi_stream)
saveRDS(cell_daily_means_fiftyi, "r_objects/cell_daily_means_fiftyi.R")

cell_daily_means_fiftyi_df <- calc_cell_daily_means(fiftyi_stream, returnDF = T, factorName = "fiftyi")
saveRDS(cell_daily_means_fiftyi_df, "r_objects/cell_daily_means_fiftyi_df.R")

cell_daily_mins_fiftyi <- calc_cell_daily_mins(fiftyi_stream)
saveRDS(cell_daily_mins_fiftyi, "r_objects/cell_daily_mins_fiftyi.R")

cell_daily_maxs_fiftyi <- calc_cell_daily_maxs(fiftyi_stream)
saveRDS(cell_daily_maxs_fiftyi, "r_objects/cell_daily_maxs_fiftyi.R")


# fifty_stream_temps <- get_spatial_points_list(fifty_stream)

fiftyi_r <- mapply(function(x) rasterize(SpatialPointsDataFrame(fiftyi_stream[fiftyi_stream$tstep == 0, c('x', 'y')], data = data.frame(temps = x)), blank_raster),
                  cell_daily_means_fiftyi,
                  SIMPLIFY = F)
saveRDS(fiftyi_r, "r_objects/fiftyi_r.R")

fiftyi_r_max <- mapply(function(x) rasterize(SpatialPointsDataFrame(fiftyi_stream[fiftyi_stream$tstep == 0, c('x', 'y')], data = data.frame(temps = x)), blank_raster),
                      cell_daily_maxs_fiftyi,
                      SIMPLIFY = F)
saveRDS(fiftyi_r_max, "r_objects/fiftyi_r_max.R")

fiftyi_r_min <- mapply(function(x) rasterize(SpatialPointsDataFrame(fiftyi_stream[fiftyi_stream$tstep == 0, c('x', 'y')], data = data.frame(temps = x)), blank_raster),
                      cell_daily_mins_fiftyi,
                      SIMPLIFY = F)
saveRDS(fiftyi_r_min, "r_objects/fiftyi_r_min.R")



