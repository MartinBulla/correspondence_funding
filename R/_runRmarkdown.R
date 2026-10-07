# ❗Never reuse an already released version number for rendering.❗

# Load
require(here)
require(rmarkdown)

# Version currently being prepared.
repo_version <- "v2.0.1" # ❗Once this version is released, do not render into it again.

# Supply the version to HTML.R
render_env <- new.env(parent = globalenv())
render_env$repo_version <- repo_version

# Create the version-specific Pages directory (if not present)
version_dir <- here::here("versions", repo_version)
dir.create(
  version_dir,
  recursive = TRUE,
  showWarnings = FALSE
)

# Render once
built_html <- rmarkdown::render(
  input       = here::here("R", "HTML.R"),
  output_dir  = here::here("Output"),
  output_file = "HTML.html",
  envir       = render_env,
  clean       = TRUE
)

# Publish the same rendered file as:
# 1. the moving/root SI
# 2. the version-specific SI, mutable until release and frozen thereafter
targets <- c(
  here::here("index.html"),
  here::here("versions", repo_version, "index.html")
)

for (target in targets) {
  copied <- file.copy(
    from      = built_html,
    to        = target,
    overwrite = TRUE
  )

  if (!copied) {
    stop("Failed to copy HTML to: ", target)
  }
}
