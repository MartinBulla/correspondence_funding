# packages
library(data.table)
library(ggplot2)

library(ggsci)
library(viridis)
library(colorspace)

# reproducibility
set.seed(1)

# load data
dt <- fread("Data/data.csv")

# identify ST-columns
st_cols <- grep("^ST", names(dt), value = TRUE)

# sanity check
stopifnot(all(c("Year", "Score") %in% names(dt)))

# long format
dt_long <- melt(
  dt,
  id.vars = c("Year", "Score"),
  measure.vars = st_cols,
  variable.name = "panel",
  value.name = "applications"
)

# Panel code -> full name
panel_map <- c(
  "ST-CHE" = "Chemistry",
  "ST-ECO" = "Economics",
  "ST-ENG" = "Information Sci & Engineering",
  "ST-ENV" = "Environment & Geosciences",
  "ST-LIF" = "Life Sciences",
  "ST-MAT" = "Mathematics",
  "ST-PHY" = "Physics",
  "ST-SOC" = "Social Sci. & Humanities"
)

dt_long[, panel_full := panel_map[as.character(panel)]]

panel_order <- c(
  "Social Sci. & Humanities",
  "Economics",
  "Life Sciences",
  "Environment & Geosciences",
  "Information Sci & Engineering",
  "Mathematics",
  "Physics",
  "Chemistry"
)

dt_long[, panel_full := factor(panel_full, levels = panel_order)]

# Ensure year is ordered (helps sequential palettes match time)
dt_long[, Year := as.integer(Year)]
dt_long[, Year_f := factor(Year, levels = sort(unique(Year)))]

# plot
p <- ggplot(
  dt_long,
  aes(x = Score, y = applications, colour = Year_f, group = Year_f)
) +
  geom_line(linewidth = 0.8) +
  facet_wrap(~ panel_full, nrow = 2) +
  labs(
    x = "Score [%]",
    y = "Applications [%]",
    colour = "Year"
  ) +
  #scale_colour_viridis_d() +
  scale_colour_brewer(palette = "YlGnBu") +
  #scale_colour_manual(values = colorspace::sequential_hcl(nlevels(dt_long$Year_f), palette = "BluGrn")) +

  theme_bw(base_size = 8) +
  theme(
    #strip.background = element_rect(fill = "grey90"),
    strip.background = element_blank(),
    panel.grid.minor = element_blank()
  )

print(p)
