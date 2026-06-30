#' ---
#' title: <font size="2">Supporting information for</font><br><font size="5">Can grant evaluation still distinguish scientific excellence?</font>
#' author: <font size="2">Martin Bulla and Peter Mikula</font><br><br><font size="2">created by Martin Bulla</font><br>
#' date: <font size="1.5">`r Sys.time()`</font>
#' bibliography: ../Resources/_bib.bib
#' link-citations: yes
#' output:
#'     html_document:
#'         toc: true
#'         toc_float: true
#'         toc_depth: 4
#'         code_folding: hide
#'         link-citations: yes
#'         css: ../Resources/styles.css
#' base:  href="/[correspondance_funding]/"
#' ---

#' <style> body {text-align: justify}</style>
#' <style> blockquote {padding: 10px 20px; margin: 0 0 20px; font-size: 12px; border-left: 2px solid #a52a2a}</style>

#+ r setup, include=FALSE
knitr::opts_chunk$set(message = FALSE, warning = FALSE, cache = FALSE, fig.retina = 1)

#' # General note
#'
#' This HTML accompanies our paper 'Can grant evaluation still distinguish scientific excellence?' by (1) navigating the repository with data and scripts, and (2) showing display items along with the code that generated them (accessible by clicking the `code` button at the top right above each display item).
#'
#'
#' When referring to or reusing these materials, **please cite** the corresponding [preprint](https://doi.org/10.31222/osf.io/d8gcu_v1) and this repository [@bulla2026].
#'
#' ## Repository contents
#'
#' [**HTML Supporting information**, including code](https://martinbulla.github.io/correspondance_funding) is generated from the following repository structure:
#'
#' [**Data**](https://github.com/MartinBulla/correspondance_funding/tree/main/Data) folder stores:
#'
#' - [`data_MSCA.csv`](https://github.com/MartinBulla/correspondance_funding/blob/main/Data/data_MSCA.csv) contains EU Marie Skłodowska-Curie Actions Postdoctoral Fellowships (MSCA - PF) data with the following columns: `Year` (of the call) and 'Score' (threshold); the remaining columns are abbreviations for each panel and contain percentages of proposals scoring at or above given `Score` ("ST-CHE" = "Chemistry", "ST-ECO" = "Economics", "ST-ENG" = "Informat. & Engineering", "ST-ENV" = "Envi. Sci. & Geosciences" "ST-LIF" = "Life Sciences", "ST-MAT" = "Mathematics", "ST-PHY" = "Physics", "ST-SOC" = "Social Sci. & Humanities"). MSCA Postdoctoral Fellowships are evaluated as full proposals submitted jointly by the researcher and host organisation through the EU Funding & Tenders Portal. Eligible proposals are assessed after the call deadline (September, in case of 2025) by at least three independent external experts against the MSCA award criteria: Excellence, Impact, and Quality and Efficiency of Implementation. Experts first evaluate proposals individually and then agree on consensus scores and comments, which form the basis of the Evaluation Summary Report and final ranking. The MSCA score distributions analysed here therefore represent eligible full proposals evaluated through this single-stage full-proposal procedure. The scoring distribution data were aggregated from EU Funding & Tenders Portal (12), which contains the official "Flash information on the overall results of the call". These reports are published annually by the European Research Executive Agency following the conclusion of the evaluation process. While individual project scores are confidential, these public summaries provide the aggregate percentages of proposals meeting or exceeding specific quality thresholds. The proposals are scored between 0 and 100%. **To access the raw reports**: (i) navigate to the EU Funding & Tenders Portal and go to Calls for proposal, (ii) search for the specific call (e.g. HORIZON-MSCA-2024-PF-01-01), (iii) look for the data, usually under the "Topic conditions and documents" or "Updates" section.
#'
#' - [`data_HFSP.csv`](https://github.com/MartinBulla/correspondance_funding/blob/main/Data/data_HFSP.csv) contains data received from Human Frontiers Science Program Postdoctoral Fellowships (HFSP - PF) with columns: `year` (of the call), `rank` (of the proposal), `score` (of the proposal). Human Frontiers Science Program evaluates the Postdoctoral Fellowships through a staged procedure. Applicants first submit a short Letter of Intent, from which the review committee selects candidates invited to submit a full proposal. The score distributions analysed here therefore represent only shortlisted applications that proceeded to full evaluation, not the full applicant pool.

#'
#' [**R**](https://github.com/MartinBulla/correspondance_funding/tree/main/R) folder stores scripts used in the analysis:
#'
#' - [`_runRmarkdown.R`](https://github.com/MartinBulla/correspondance_funding/blob/main/R/_runRmarkdown.R) generates the HTML [Supporting information](https://martinbulla.github.io/correspondance_funding/) from [`HTML.R`](https://github.com/MartinBulla/correspondance_funding/blob/main/R/HTML.R).
#' - [`HTML.R`](https://github.com/MartinBulla/correspondance_funding/blob/main/R/HTML.R) is the script behind the [HTML](https://martinbulla.github.io/correspondance_funding/), containing all code used to generate the paper outputs.
#'
#' [**Output**](https://github.com/MartinBulla/correspondance_funding/tree/main/Output) folder stores separate files of all outputs used in the manuscript:
#'
#' - [HTML](https://github.com/MartinBulla/correspondance_funding/blob/main/Output/HTML.html)
#' - [Fig_1.png](https://github.com/MartinBulla/correspondance_funding/blob/main/Output/Fig_1_widht-185mm.html)
#' - [Fig_2.png](https://github.com/MartinBulla/correspondance_funding/blob/main/Output/Fig_2_width-60mm.html)
#'
#' [**Resources**](https://github.com/MartinBulla/correspondance_funding/tree/main/Resources) folder stores:
#'
#' - [`_bib.bib`](https://github.com/MartinBulla/correspondance_funding/blob/main/Resources/_bib.bib) bibliography used in the [HTML](https://martinbulla.github.io/correspondance_funding/).
#' - [`styles.css`](https://github.com/MartinBulla/correspondance_funding/blob/main/Resources/styles.css) defines graphical parameters for the HTML generation.
#'
#' ### License and reuse
#'
#'*Author-generated materials* in this repository, including collated data, derived data, scripts, figures, outputs and HTML, are licensed under the Creative Commons Attribution 4.0 International License [CC-BY-4.0](https://github.com/MartinBulla/correspondance_funding/blob/main/LICENSE).
#'
#'
#' ### Version history
#'
#' - v1.0.0: The first public release of the [`correspondance_funding`](https://github.com/MartinBulla/correspondance_funding/) repository, archived for reproducibility of the first preprint version.
#' - v2.0.0: Archived for reproducibility of the second preprint version.


#'
#' ***

#' ###### Code to load tools and data
#+ start, echo = T, results = 'hide', warning=FALSE

# TOOLS

# Packages, settings
require(data.table)
require(ggplot2)
require(grid)
require(gridExtra)
require(here)
require(kableExtra)
require(magrittr)
require(patchwork)
require(viridis)
require(tibble)

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

    legend.background = element_blank(),
    legend.box.background = element_blank(),
    legend.key = element_blank(),

    strip.text = element_text(size = rel(0.72)), #
    strip.placement = "outside",
    strip.background = element_blank(),

    #panel.spacing.x = unit(6, "pt"),  # try 6–12 pt,
    panel.border = element_rect(colour = "grey60"),
    panel.grid.major = element_line(colour = "grey95"),
    panel.grid.minor = element_blank()
  )

#' # Figures

#+ F_1, fig.width=18.5/2.5, fig.height = 5.5/2.5

# PANEL A

# define colors
pal <- colorspace::qualitative_hcl(
  n = 8,
  palette = "Dark 3"
)

# load data
dt <- fread(here::here("Data/data_MSCA.csv"))

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
#summary(dt_long[Score%in%85 & Year == 2025])
#summary(dt_long[Score%in%85 & Year < 2025])


# plot
pA <- ggplot(
  dt_long,
  aes(x = Score, y = applications, colour = Year_f, group = Year_f)
) +
  geom_line(linewidth = 0.5) +
  facet_wrap(~ panel_full, nrow = 2) +
  labs(
    x = "Evaluation score",
    y = "Proposals scoring ≥ score",
    colour = "Year"
  ) +
  scale_colour_viridis_d() +
  guides(colour = guide_legend(reverse = TRUE)) +
  #scale_y_continuous(limits = c(0, 100),expand = expansion(mult = c(0, 0))) +
  #scale_x_continuous(limits = c(70, 100),expand = expansion(mult = c(0, 0))) +
  scale_y_continuous(
    limits = c(0, 100),
    labels = scales::label_percent(scale = 1, accuracy = 1),
    expand = expansion(mult = c(0, 0))
  ) +
  scale_x_continuous(
    limits = c(70, 100),
    labels = scales::label_percent(scale = 1, accuracy = 1),
    expand = expansion(mult = c(0, 0))
  ) +
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
  geom_line(aes(col = panel_full), linewidth = 0.15) +
  geom_point(aes(col = panel_full), cex = .5) + #, shape = 21, bg = 'white', cex = .8) +
  #stat_smooth(method = "loess", se = FALSE, linewidth = 0.5, span = 0.75, col = 'black') +
  facet_wrap(~ dummy, nrow = 1) +
  labs(
    x = "Year",
    y = "Proposals scoring ≥ 95%",
    colour = "Evaluation panel"
  ) +
  #scale_colour_manual(values = khroma::colour("muted")(8)) +
  #scale_colour_manual(values = palette.colors(8, "Okabe-Ito")) + #
  #scale_colour_carto_d(palette = "Safe") +
  ggsci::scale_colour_aaas() +
  #1ggsci::scale_colour_npg() +
  #ggsci::scale_colour_jco() +
  #scale_color_manual(values = pal) +
  #scale_colour_viridis_d() +
  #guides(colour = guide_legend(reverse = TRUE)) +
  #scale_colour_brewer(palette = "YlGnBu") +
  #scale_colour_manual(values = colorspace::sequential_hcl(nlevels(dt_long$Year_f), palette = "BluGrn")) +
  scale_y_continuous(
    limits = c(0, 25),
    breaks = seq(0, 25, by = 5),
    labels = function(x) ifelse(x == 0, "", paste0(x, "%")),
    expand = expansion(mult = c(0, 0))
  ) +
  #scale_y_continuous(limits = c(0, 25), breaks = seq(0,25, by =5), labels = c("", 5, 10, 15, 20, 25), expand = expansion(mult = c(0, 0))) +
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
ggsave(here::here("Output/Fig_1_width-185mm.png"),gg_tagged, width = 18.5, height = 5.5, units = 'cm')

knitr::include_graphics(here::here("Output/fig_1_width-185mm.png"))

#' <a name="F_1">**Figure 1</a> | Temporal shift and score compression in evaluations of Marie Skłodowska-Curie Actions postdoctoral fellowships.** **a**, Temporal trend in the percentage of proposals scoring at or above threshold across evaluation panels. The 2025 cohort (yellow) shows a marked divergence from the tightly clustered historical distribution (2018–2024), shifting toward higher scores across all deciles. For example, the 85% ‘Seal of Excellence’ threshold was reached by ~`r dt_long[Score%in%85 & Year == 2025, round(median(applications))]`% of proposals in 2025, compared to ~`r dt_long[Score%in%85 & Year!=2025, round(median(applications))]`% in previous years (medians). n~2018~ = 9,830 applications, n~2019~ = 9,875, n~2020~ = 11,573, n~2021~  = 8,356, n~2022~ = 7,044, n~2023~ = 8,039, n~2024~ = 10,360, n~2025~ = 17,066. **b**, Temporal trend of "excellence saturation", defined as the percentage of proposals achieving a score ≥95%. Data extracted from the [EU Funding & Tenders Portal](https://ec.europa.eu/info/funding-tenders/opportunities/portal/) and available via [@bulla2026].
#'



#+ F_2, fig.width=6/2.5, fig.height = 4.5/2.5

# colors
year_cols <- setNames(
  viridis(8, option = "D", direction = 1),
  2018:2025
) #year_cols["2025"]


pal <-c(year_cols["2024"], year_cols["2025"]) # c("2024" = "grey60", "2025" = "#FDE725FF")

# data
dt <- fread(here::here("Data/data_HFSP.csv"))
dt[year == 2025, year:=2024] # HFSP calls the call 2025, but the deadline for the applicants (and here relevant) is 2024
dt[year == 2026, year:=2025] # HFSP calls the call 2026, but the deadline for the applicants (and here relevant) is 2025
dt[, percent := 100*score/10]
dt[, year_chr := as.character(year)]
dt[, year_f := factor(year)]

# percentage of evaluated proposals scoring >= each threshold
ccdf <- dt[, {
  th <- seq(0, 100, by = 1)
  .(
    Score = th,
    applications = vapply(th, function(x) mean(percent >= x)*100, numeric(1)),
    n = .N
  )
}, by = year_f]

# plot
p_hfsp <- ggplot(
  ccdf,
  aes(x = Score, y = applications, colour = year_f, group = year_f)
) +
  geom_step(linewidth = 0.6) +
  labs(
    x = "Evaluation score",
    y = "Proposals scoring ≥ score",
    colour = "Year"
  ) +
  scale_color_manual(values = pal) +
  #scale_colour_viridis_d() +
  guides(colour = guide_legend(reverse = TRUE)) +
  coord_cartesian(xlim = c(40, 100), ylim = c(0, 100)) +
  scale_y_continuous(
      limits = c(0, 100),
       labels = scales::label_percent(scale = 1, accuracy = 1),
      expand = expansion(mult = c(0, 0)), breaks = seq(0,100, by = 25)
      ) +

  scale_x_continuous(labels = function(x) ifelse(x == 0, "", paste0(x, "%")), expand = expansion(mult = c(0, 0))) +
  theme_bw(base_size = 7) +
  theme_MB +
  theme(
    legend.position = c(0.95, 0.95),
    legend.justification = c(1, 1),
    legend.background = element_rect(fill = scales::alpha("white", 0.7), colour = NA),
    legend.key = element_blank(),
    legend.box.background = element_blank(),

    plot.margin = margin(t = 4, r = 8)
  )

ggsave(here::here("Output/Fig_2_width-60mm.png"),p_hfsp, width = 6, height = 4.5, units = 'cm')

p_hfsp

#' <a name="F_2">**Figure 2</a> | Score distributions in evaluations of Human Frontier Science Program Postdoctoral Fellowships.** Percentage of evaluated full proposals scoring at or above each evaluation-score threshold in the 2024 and 2025 calls. Proposal scores were originally provided on a 0–10 scale and were transformed to percentages to match the threshold-based representation used in Fig. 1. The two years show  similar cumulative score distributions. n~2024~ = 65 applications, n~2025~ = 70. Data are available via [@bulla2026].

#' <br />
#'
#' ***
#'
#' # Session info

#' <a name="T_2">
#' **Table S1 | System session info.** </a>
df_session_platform <- devtools::session_info()$platform %>%
  unlist(.) %>%
  as.data.frame(.) %>%
  rownames_to_column(.)

colnames(df_session_platform) <- c("Item", "Value")

df_session_platform %>%
  kbl(align=c('r', 'l'), linesep = "") %>%
  kable_paper(c("striped", "condensed"), full_width = F, position = "left")
#'
#' <a name="T_S2">
#' **Table S2 | Info about used packages.** </a>
df_session_packages <- devtools::session_info()$packages %>%
  as.data.frame(.) %>%
  # filter(attached == TRUE) %>%
  dplyr::select(loadedversion, date, source) %>%
  rownames_to_column()

colnames(df_session_packages) <- c("Package", "Loaded version", "Date", "Source")
df_session_packages %>%
  kbl(align = c("l", "l","l","l"), linesep = "") %>%
  kable_paper(c("striped", "condensed"), full_width = F, position = "left") %>%
  scroll_box(height = "650px") #width = "90%",
#'
#' ***
#'
#' # References
