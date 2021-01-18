# A functioning version of StreamMetabolizer (runs practice data within R package)
# Compiled by Jill Arriola August 2020
# Produces same results as practice in the vignette for StreamMetabolizer

# Load libraries
library(dplyr)
library(tidyverse)
library(lubridate)
remotes::install_github("USGS-R/streamMetabolizer")
library(streamMetabolizer)

# Load data
dat <- data_metab(num_days='3', res='15', day_start=4, day_end=28, attach.units=TRUE)

# Decide which Bayesian model to use
bayes_name <- mm_name(type='bayes', pool_K600='none', err_obs_iid=TRUE, err_proc_iid=TRUE)
bayes_name

# Observe specs for selected model
bayes_specs <- specs(bayes_name)
bayes_specs

# Run metabolism model
mm <- metab(bayes_specs, data=dat)

# See outputs of metabolism model
mm

# See table of metabolism predictions
predict_metab(mm)

# Plot of daily GPP and ER predictions
plot_metab_preds(mm)

# See table of daily averages of predicted parameters 
get_params(mm)

# See table of DO.obs and DO.mod
predict_DO(mm) %>% head()

# Plot of DO observations versus DO predictions
plot_DO_preds(mm)
