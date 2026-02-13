# TOOLS

# packages
library(data.table)
library(ggplot2)
library(grid)
require(gridExtra)
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

# constants
pal <- colorspace::qualitative_hcl(
  n = 8,
  palette = "Dark 3"
)

theme_MB = theme(
    axis.ticks = element_blank(),
    axis.ticks.length = unit(0, "pt"),

    axis.title = element_text(size = rel(0.9)),
    axis.text = element_text(size = rel(0.775)),
    axis.text.x = element_text(margin = margin(t = 3)),
    axis.text.y = element_text(margin = margin(r = 3)),


    legend.key.height = unit(0.3, "cm"),
    legend.spacing.y  = unit(0.1, "cm"),

    # bring legend closer to plot
    legend.box.spacing = unit(0, "pt"),
    legend.margin = margin(0, 1, 0, 7, unit = "pt"),

    legend.title = element_text(size = rel(0.8)),
    legend.text = element_text(size = rel(0.75)),

    strip.text = element_text(size = rel(0.72)), #
    strip.placement = "outside",
    strip.background = element_blank(),


    #panel.spacing.x = unit(6, "pt"),  # try 6–12 pt,
    panel.border = element_rect(colour = "grey60"),
    panel.grid.major = element_line(colour = "grey95"),
    panel.grid.minor = element_blank()
  )

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
  "ST-ENG" = "Informat. & Engineering",
  "ST-ENV" = "Envi. Sci. & Geosciences",
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
  "Envi. Sci. & Geosciences",
  "Informat. & Engineering",
  "Mathematics",
  "Physics",
  "Chemistry"
)

dt_long[, panel_full := factor(panel_full, levels = panel_order)]

dt_long[, dummy := ""] # dummy for plotting
# Ensure year is ordered (helps sequential palettes match time)
dt_long[, Year := as.integer(Year)]
dt_long[, Year_f := factor(Year, levels = sort(unique(Year)))]

# Descriptive summary
summary(dt_long[Score%in%85 & Year == 2025])
summary(dt_long[Score%in%85 & Year < 2025])


# PANEL A plot
pA <- ggplot(
  dt_long,
  aes(x = Score, y = applications, colour = Year_f, group = Year_f)
) +
  geom_line(linewidth = 0.5) +
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

  theme_bw(base_size = 7) +
  theme_MB

pA_gr <- ggplotGrob(pA)  # view with #g_tr_des$layout$name
pA_gr <- gtable_filter_remove(pA_gr, name = c("axis-b-2-2", "axis-b-4-2"), trim = FALSE)

# PANEL B
pB <- ggplot(
  dt_long[Score%in%95],
  aes(x = Year, y = applications)
) +
  geom_line(aes(col = panel_full), linewidth = 0.25) +
  geom_point(aes(col = panel_full), cex = .8) + #, shape = 21, bg = 'white', cex = .8) +
  #stat_smooth(method = "loess", se = FALSE, linewidth = 0.5, span = 0.75, col = 'black') +
  facet_wrap(~ dummy, nrow = 1) +
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

  scale_y_continuous(limits = c(0, 25), breaks = seq(0,25, by =5), labels = c("", 5, 10, 15, 20, 25), expand = expansion(mult = c(0, 0))) +
  scale_x_continuous(limits = c(2018, 2025),breaks = seq(2018,2025, by = 1), expand = expansion(mult = c(0, 0))) +

  theme_bw(base_size = 7) +
  theme_MB

pB_gr <- ggplotGrob(pB)

# COMBINE PANELS A & B
gap <- grid::nullGrob()  # blank spacer

gg = arrangeGrob(
      grobs = list(pA_gr,gap, pB_gr),
       #widths = c(0.6, 0.4)
      widths = unit.c(unit(0.595, "npc"), unit(0.01, "npc"), unit(0.395, "npc"))
      )


gg_tagged <- grobTree(
  gg,
  textGrob("a", x = unit(0.0075, "npc"), y = unit(0.99, "npc"),
           just = c("left", "top"),
           gp = gpar(fontsize = 7, fontface = "bold")),
  textGrob("b", x = unit(0.61, "npc"), y = unit(0.99, "npc"),
           just = c("left", "top"),
           gp = gpar(fontsize = 7, fontface = "bold"))
)

# EXPORT
ggsave("Output/Fig_1ab_v3.png",gg_tagged, width = 18, height = 5.5, units = 'cm')
