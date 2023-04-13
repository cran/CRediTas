## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)

## ----create_template----------------------------------------------------------
library(CRediTas)

cras_table <- template_create(authors = c("Friedrich Ratzel", 
                                          "Pau Vidal de la Blache", 
                                          "Élisée Reclus"))
knitr::kable(cras_table)


## ----fix, eval=FALSE----------------------------------------------------------
#  
#  fix(cras_table)
#  

## ----write_csv, eval=FALSE----------------------------------------------------
#  
#  template_create(authors = c("Friedrich Ratzel",
#                                            "Pau Vidal de la Blache",
#                                            "Élisée Reclus"),
#                              file = path_to_your_csv_file)
#  

## ----define_roles-------------------------------------------------------------

cras_got <- template_create(authors = c("Danaerys Targaryen", "Kingslayer", "John Snow"),
                roles = c("Free slaves", "Kill white walkers", "Ride dragons"))

# add contribution roles
cras_got[-2, -1] <- 1

knitr::kable(cras_got)


## ----template_read, eval=FALSE------------------------------------------------
#  
#  cras_table <- template_read(path_to_your_csv_file)
#  

## ----populate_random, echo=FALSE----------------------------------------------

cras_table[, 2:ncol(cras_table)] <- sample(0:1, size=3*14, 
                                           replace = TRUE, prob = c(0.6, 0.4))
knitr::kable(cras_table)


## -----------------------------------------------------------------------------

textfile <- tempfile()

cras_write(cras_table, textfile, markdown = TRUE)


## ---- eval = FALSE------------------------------------------------------------
#  
#  cras_write(cras_got, drop = FALSE, markdown = TRUE)
#  

