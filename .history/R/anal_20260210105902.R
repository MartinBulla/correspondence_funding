# packages
library(data.table)
library(ggplot2)

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
  variable.name = "st_metric",
  value.name = "st_value"
)

# plot
p <- ggplot(
  dt_long,
  aes(x = score, y = st_value, colour = factor(year), group = year)
) +
  geom_line(linewidth = 0.8) +
  facet_wrap(~ st_metric, scales = "free_y") +
  labs(
    x = "Score",
    y = "Value",
    colour = "Year"
  ) +
  theme_bw() +
  theme(
    legend.position = "bottom",
    strip.background = element_rect(fill = "grey90"),
    panel.grid.minor = element_blank()
  )

print(p)
