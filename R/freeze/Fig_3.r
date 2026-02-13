# packages
library(colorspace)
library(data.table)
library(ggplot2)
library(grid)
library(viridis)
library(viridisLite)

# function
gtable_filter_remove <- function (x, name, trim = TRUE){
  matches <- !(x$layout$name %in% name)
  x$layout <- x$layout[matches, , drop = FALSE]
  x$grobs <- x$grobs[matches]
  if (trim)
    x <- gtable_trim(x)
  x
}

# constants
okabe_ito <- c(
  "#000000",  # black
  "#0072B2", # blue
  "#56B4E9", # sky blue
  "#009E73", # bluish green
  "#F0E442", # yellow
  "#E69F00", # orange
  "#D55E00", # vermillion
  "#CC79A7" # reddish purple
)


pal <- colorspace::qualitative_hcl(
  n = 8,
  palette = "Dark 3"
)

pal_turbo_light <- lighten(turbo(8), amount = 0.25)

# load data
dt <- fread("Data/data_project_num.csv")

# identify ST-columns
st_cols <- grep("^ST", names(dt), value = TRUE)

# long format
dt_long <- melt(
  dt,
  id.vars = c("year"),
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

#dt_long[, panel_full := factor(panel_full, levels = panel_order)]



# plot & export
p <- ggplot(
  dt_long,
  aes(x = year, y = applications, colour = panel_full)
) +
  #geom_point() +
  geom_line() +
  #facet_wrap(~ panel_full, nrow = 2) +
  labs(
    x = "Year",
    y = "Applications [count]",
    colour = "Evaluation panel"
  ) +
  #scale_colour_viridis_d() +
  #guides(colour = guide_legend(reverse = TRUE)) +
  scale_color_manual(values = pal) +
  #scale_color_manual(values = viridisLite::turbo(8)) +
  #scale_color_manual(values = okabe_ito) +
  #scale_color_manual(values = pal_turbo_light) +

  scale_y_continuous(expand = expansion(mult = c(0, 0))) +
  scale_x_continuous(limits = c(2018, 2025), breaks = seq(2018, 2024, by = 2), expand = expansion(mult = c(0, 0))) +

  #scale_colour_brewer(palette = "YlGnBu") +
  #scale_colour_manual(values = colorspace::sequential_hcl(nlevels(dt_long$Year_f), palette = "BluGrn")) +

  theme_bw(base_size = 8) +
  theme(
    axis.ticks = element_blank(),
    axis.ticks.length = unit(0, "pt"),
    #axis.text.x = element_text(margin = margin(t = 3)),
    #axis.text.y = element_text(margin = margin(r = 3)),

    legend.key.height = unit(0.35, "cm"),
    legend.spacing.y  = unit(0.1, "cm"),
    legend.title = element_text(size = rel(0.8)),
    legend.text = element_text(size = rel(0.7)),

    strip.background = element_blank(),
    #panel.spacing.x = unit(6, "pt"),  # try 6–12 pt,
    panel.grid.minor = element_blank()
  )

ggsave("Output/Fig_3.png",p, width = 9.5, height = 6, units = 'cm')
