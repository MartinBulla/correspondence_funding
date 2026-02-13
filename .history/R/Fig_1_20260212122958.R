# TOOLS

# packages
library(data.table)
library(ggplot2)
library(grid)
library(patchwork)
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


# PANEL A
# load data
dt <- fread("Data/data.csv")

# identify ST-columns
st_cols <- grep("^ST", names(dt), value = TRUE)

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

# PANEL B
# load data
d <- fread("Data/data.csv")

# identify ST-columns
st_cols <- grep("^ST", names(d), value = TRUE)

# long format
d_long <- melt(
  d,
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

d_long[, panel_full := panel_map[as.character(panel)]]

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

d_long[, panel_full := factor(panel_full, levels = panel_order)]

# Ensure year is ordered (helps sequential palettes match time)
d_long[, Year := as.integer(Year)]
d_long[, Year_f := factor(Year, levels = sort(unique(Year)))]

# plot & export
p <- ggplot(
  d_long[Score%in%95],
  aes(x = Year, y = applications)
) +
  geom_line(aes(col = panel_full), linewidth = 0.25) +
  geom_point(aes(col = panel_full), shape = 21, bg = 'white', cex = .8) +
  #stat_smooth(method = "loess", se = FALSE, linewidth = 0.5, span = 0.75, col = 'black') +

  labs(
    x = "Year",
    y = "Proposals [%] scoring ≥ 95%",
    colour = "Evaluation panel"
  ) +
  scale_color_manual(values = pal) +
  #scale_colour_viridis_d() +
  #guides(colour = guide_legend(reverse = TRUE)) +
  #scale_colour_brewer(palette = "YlGnBu") +
  #scale_colour_manual(values = colorspace::sequential_hcl(nlevels(dt_long$Year_f), palette = "BluGrn")) +

  #scale_y_continuous(limits = c(0, 100),expand = expansion(mult = c(0, 0))) +
  scale_x_continuous(limits = c(2018, 2025),breaks = seq(2018,2025, by = 1), expand = expansion(mult = c(0, 0))) +

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

p_gr | p

ggsave("Output/Fig_1b_v3.png",p, width = 9.5, height = 6, units = 'cm')

