# packages
library(data.table)
library(ggplot2)
library(grid)
library(viridis)

# function
gtable_filter_remove <- function (x, name, trim = TRUE){
  matches <- !(x$layout$name %in% name)
  x$layout <- x$layout[matches, , drop = FALSE]
  x$grobs <- x$grobs[matches]
  if (trim)
    x <- gtable_trim(x)
  x
}

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

# plot & export
p <- ggplot(
  dt_long,
  aes(x = Score, y = applications, colour = Year_f, group = Year_f)
) +
  geom_line(linewidth = 0.8) +
  facet_wrap(~ panel_full, nrow = 2) +
  labs(
    x = "Proposal score [%]",
    y = "Proposals ≥ score [%]",
    colour = "Year"
  ) +
  scale_colour_viridis_d() +
  guides(colour = guide_legend(reverse = TRUE)) +
  scale_y_continuous(limits = c(0, 100),expand = expansion(mult = c(0, 0))) +
  scale_x_continuous(limits = c(70, 100),expand = expansion(mult = c(0, 0))) +

  #scale_colour_brewer(palette = "YlGnBu") +
  #scale_colour_manual(values = colorspace::sequential_hcl(nlevels(dt_long$Year_f), palette = "BluGrn")) +

  theme_bw(base_size = 8) +
  theme(
    axis.ticks = element_blank(),
    axis.ticks.length = unit(0, "pt"),
    axis.text.x = element_text(margin = margin(t = 3)),
    axis.text.y = element_text(margin = margin(r = 3)),

    legend.key.height = unit(0.35, "cm"),
    legend.spacing.y  = unit(0.1, "cm"),
    legend.title = element_text(size = rel(0.8)),
    legend.text = element_text(size = rel(0.7)),

    strip.background = element_blank(),
    #panel.spacing.x = unit(6, "pt"),  # try 6–12 pt,
    panel.grid.minor = element_blank()
  )

p_gr <- ggplotGrob(p)  # view with #g_tr_des$layout$name
p_gr <- gtable_filter_remove(p_gr, name = c("axis-b-2-2", "axis-b-4-2"), trim = FALSE)
grid.draw(p_gr)#; ggsave('Output/Fig_E1a.png', g_tr_des, units = 'cm', width = 20, height = 25)

ggsave("Output/Fig_1.png",p_gr, width = 15.5, height = 8, units = 'cm')
