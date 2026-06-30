require(rmarkdown)

# run
rmarkdown::render("R/HTML.R", output_dir = "Output", output_file = "HTML.html")

# More general sweep: remove any leftover cache/files folders for this script
junk <- list.files(
  path = here::here(),
  pattern = "^MS_online_material(\\.spin)?_(cache|files)$",
  recursive = TRUE,
  full.names = TRUE,
  include.dirs = TRUE
)

unlink(junk, recursive = TRUE, force = TRUE)

options(
  repos = c(CRAN = "https://cloud.r-project.org"),
  BioC_mirror = "https://bioconductor.org",
  menu.graphics = FALSE
)
