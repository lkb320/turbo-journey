#' ---
#' output: github_document
#' ---

library(fs)
library(tidyverse)

## Huh? Maybe this is an symbolic link issue?
identical(path_real(.Library), path_real(.libPaths()[2]))

#' Installed packages
ipt <- installed.packages() %>%
  as_tibble()

## how many packages?
nrow(ipt)

#' Exploring the packages

## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
ipt %>%
  count(LibPath, Priority)

##   * what proportion need compilation?
ipt %>%
  count(NeedsCompilation) %>%
  mutate(prop = n / sum(n))

##   * how break down re: version of R they were built on
ipt %>%
  count(Built) %>%
  mutate(prop = n / sum(n))


