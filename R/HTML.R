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
#'         self_contained: true
#' ---

#+ r setup, include=FALSE
knitr::opts_chunk$set(message = FALSE, warning = FALSE, cache = FALSE, fig.retina = 1)

if (!exists("repo_version")) {
  stop("repo_version was not supplied by _runRmarkdown.R")
}

repo_url <- "https://github.com/MartinBulla/correspondence_funding"
pages_url <- "https://martinbulla.github.io/correspondence_funding/"

repo_tree <- paste0(repo_url, "/tree/", repo_version)
repo_blob <- paste0(repo_url, "/blob/", repo_version)
versioned_si <- paste0(pages_url, "versions/", repo_version, "/")

#' # General note
#'
#' This HTML Supporting information accompanies our paper 'Can grant evaluation still distinguish scientific excellence?' by navigating the repository with data and scripts, describing the data, and showing display items along with the code that generated them (accessible by clicking the `code` button at the top right above each display item).
#'

#' When referring to or reusing these materials, **please cite** the corresponding preprint [@bulla2026av201] and Supporting information [@bulla2026bv201].
#'

#' ## Version history
#'
#' - [v2.0.1](`r paste0(repo_url, "/tree/v2.0.1")`): Repository version associated with preprint [version 3](https://osf.io/preprints/metaarxiv/d8gcu_v5) and containing expanded documentation of funding-scheme evaluation procedures, PDF figure export, and corresponding [HTML Supporting Information](https://martinbulla.github.io/correspondence_funding/versions/v2.0.1/).
#' - [v2.0.0](`r paste0(repo_url, "/tree/v2.0.0")`): Repository version associated with preprint [version 2](https://osf.io/preprints/metaarxiv/d8gcu_v2) and corresponding [HTML Supporting Information](https://martinbulla.github.io/correspondence_funding/versions/v2.0.0/).
#' - [v1.0.0](`r paste0(repo_url, "/tree/v1.0.0")`): Repository version associated with preprint [version 1](https://osf.io/preprints/metaarxiv/d8gcu_v1).
#' - **Note:** The [main](https://github.com/MartinBulla/correspondence_funding/) branch may contain changes made after the most recent release.
#'

#' ## Repository contents
#'
#' This HTML Supporting information is generated from the following repository structure:
#'

#' [**Data**](`r paste0(repo_tree, "/Data")`) folder stores:
#'

#' - [`data_MSCA.csv`](`r paste0(repo_blob, "/Data/data_MSCA.csv")`): contains cumulative freely accessible score distributions for the EU *Marie Skłodowska-Curie Actions Postdoctoral Fellowships* for call years 2018-2025. The analyses presented here use the eight Standard/European Fellowship scientific panels (abbreviated as `ST-CHE` = "Chemistry", `ST-ECO` = "Economics", `ST-ENG` = "Informat. & Engineering", `ST-ENV` = "Envi. Sci. & Geosciences", `ST-LIF` = "Life Sciences", `ST-MAT` = "Mathematics", `ST-PHY` = "Physics", `ST-SOC` = "Social Sci. & Humanities").
#'  <span style="display:block; margin-top:0.4em;">
#' **The dataset includes the following columns**: `Year` (of the call) and `Score` (0–100%); the remaining columns are abbreviations for each panel and contain percentages of proposals scoring at or above the given `Score`.
#'  </span>
#'  <span style="display:block; margin-top:0.4em;">
#' The data were aggregated from the [EU Funding & Tenders Portal](https://ec.europa.eu/info/funding-tenders/opportunities/portal/), which contains the official "Flash information on the overall results of the call". These reports are published annually by the European Research Executive Agency following the conclusion of the evaluation process. While individual proposal scores are confidential, these public summaries provide the aggregate percentages of proposals meeting or exceeding specific quality thresholds. The proposals are scored on a scale from 0 to 100%.
#'  </span>
#'  <span style="display:block; margin-top:0.4em;">
#'  **To access the raw reports:** (i) navigate to the EU Funding & Tenders Portal → Funding → Calls for proposals, (ii) in the Quick search field, enter the specific call name (e.g. HORIZON-MSCA-2024-PF-01-01), (iii) look for the data, usually under the "Topic conditions and documents" or "Updates" section.
#'  </span>
#'  <span style="display:block; margin-top:0.4em;">
#'  **Evaluation procedure.** *Marie Skłodowska-Curie Actions Postdoctoral Fellowships* use a single-stage full-proposal evaluation procedure. Applicants submit jointly with a host organisation and select one of eight main scientific evaluation panels (see above). Eligible proposals are evaluated after the call deadline (in September for the 2025 call) by at least three independent external experts against three award criteria: Excellence, Impact, and Quality and efficiency of the implementation, weighted 50%, 30%, and 20%, respectively. Each criterion is scored from 0 to 5 and the weighted scores form the final score on a 0–100 scale. Experts first evaluate proposals independently and then agree on consensus scores and comments. These evaluations are subsequently quality-checked at panel level, where scores may exceptionally be adjusted. Proposals are then ranked within each evaluation panel in descending order of their final total score.
#'  </span>
#'  <span style="display:block; margin-top:0.4em;">
#' **Scope of analysed data.** The score distributions analysed here therefore represent eligible proposals that underwent this single-stage evaluation procedure, rather than proposals pre-selected through an initial short-proposal stage. Proposals with an overall score of at least 70% are considered positively evaluated; funding then depends on their position in the ranked list and the available budget. We focus on the eight Standard/European Fellowship scientific panels because they provide the largest and most comparable series across years. The dataset also contains Global Fellowship panels (GF-*) and, for earlier Horizon 2020 calls, the Career Restart (CAR), Reintegration (RI) and Society & Enterprise (SE) panels; these represent distinct fellowship modalities or special-purpose panels and were therefore not included in the analyses.
#'  </span>
#'

#' - [`data_HFSP.csv`](`r paste0(repo_blob, "/Data/data_HFSP.csv")`): contains non-public, anonymized proposal-level evaluation-score data kindly provided by the [*Human Frontier Science Program*](https://www.hfsp.org) (HFSP) for evaluated Full Proposals submitted to the [Postdoctoral Fellowships](https://www.hfsp.org/funding/hfsp-funding/postdoctoral-fellowships) and [Research Grants](https://www.hfsp.org/funding/hfsp-funding/research-grants) schemes for 2022–2025.
#'  <span style="display:block; margin-top:0.4em;">
#' **The provided dataset includes the following columns**: `scheme`:  funding scheme (Postdoctoral Fellowships or Research Grants), `year`:  award year of the call (2022–2025), `rank`: rank of the Full Proposal within the given `scheme` and `year`, `score`: final evaluation score assigned by the Review Committee (1-10).
#'  </span>
#'  <span style="display:block; margin-top:0.4em;">
#'  We transformed the scores into percentages, with 10 representing 100%, and, to match Fig. 1, calculated the percentage of evaluated proposals scoring at or above each percentage threshold.
#'  </span>
#'  <span style="display:block; margin-top:0.4em;">
#'  **Evaluation procedure.** The Human Frontier Science Program uses a two-stage evaluation procedure. Applicants first submit a short Letter of Intent (deadline in spring), which is evaluated by a scheme-specific Reviewer Committee of ~25 members. Each Letter is assessed independently by two reviewers, with individual reviewers typically evaluating 30–70 applications. Letters receive categorical ratings from A to D; reviewers are given approximate guidance on the expected distribution of ratings to reduce differences in scoring tendencies among reviewers.
#'  </span>
#'  <span style="display:block; margin-top:0.4em;">
#' Each year, a roughly similar number of applicants are shortlisted and invited to submit a Full Proposal. At this stage, each proposal is evaluated in detail by three Review Committee members, with each member assigned approximately 10–15 proposals. The assigned reviewers their assessments during the committee meeting. Following discussion, committee members assign numerical scores on a 1–10 scale, and the resulting mean score is used to rank proposals.
#'  </span>
#'  <span style="display:block; margin-top:0.4em;">
#' **Scope of analysed data.** The score distributions analysed here therefore represent only shortlisted applications that advanced to the Full Proposal stage, not the full applicant pool. Note that the Postdoctoral Fellowships data include applications to the Long-Term Fellowships scheme, for applicants with a PhD in a biological discipline who wish to undertake a novel, frontier project in the life sciences, but not applications to the Cross-Disciplinary Fellowships scheme, which makes only approximately five awards per year. Similarly, the Research Grants data include applications to the Program scheme, but not to the Early Career scheme, which usually makes fewer than 10 awards per year.
#'  </span>
#'

#' [**R**](`r paste0(repo_tree, "/R")`)  folder stores scripts used in the analysis:
#'
#' - [`_runRmarkdown.R`](`r paste0(repo_blob, "/R/_runRmarkdown.R")`) generates this HTML Supporting information from [`HTML.R`](`r paste0(repo_blob, "/R/HTML.R")`).
#' - [`HTML.R`](`r paste0(repo_blob, "/R/HTML.R")`) is the script behind this HTML Supporting information, containing all code used to generate the paper outputs.
#'

#' [**Output**](`r paste0(repo_tree, "/Output")`)  folder stores separate files of all outputs used in the manuscript:
#'
#' - [HTML.html](`r paste0(repo_blob, "/Output/HTML.html")`)
#' - [Fig_1.png](`r paste0(repo_blob, "/Output/Fig_1_width-185mm.png")`)
#' - [Fig_1.pdf](`r paste0(repo_blob, "/Output/Fig_1_width-185mm.pdf")`)
#' - [Fig_2.png](`r paste0(repo_blob, "/Output/Fig_2_width-85mm.png")`)
#' - [Fig_2.pdf](`r paste0(repo_blob, "/Output/Fig_2_width-85mm.pdf")`)
#'

#' [**Resources**](`r paste0(repo_tree, "/Resources")`) folder stores:
#'
#' - [`_bib.bib`](`r paste0(repo_blob, "/Resources/_bib.bib")`) bibliography used in this HTML Supporting information
#' - [`styles.css`](`r paste0(repo_blob, "/Resources/styles.css")`) defines graphical parameters for this HTML Supporting information generation.
#'

#' [versions](`r paste0(repo_tree, "/versions")`) stores immutable release-specific HTML Supporting Information.
#'

#' ### License and reuse
#'
#'*Author-generated materials* in this repository, including collated data, derived data, scripts, figures, outputs and HTML, are licensed under the Creative Commons Attribution 4.0 International License [CC-BY-4.0](`r paste0(repo_blob, "/LICENSE")`)
#'
#'
#' ***

#' ###### Code to load tools and data
#+ start, echo = T, results = 'hide', warning=FALSE

# TOOLS

# Packages, settings
require(data.table)
require(ggh4x)
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

ggsave(
  here::here("Output/Fig_1_width-185mm.pdf"),
  gg_tagged,
  width = 18.5,
  height = 5.5,
  units = "cm",
  device = cairo_pdf
)

knitr::include_graphics(here::here("Output/Fig_1_width-185mm.png"))

#' <a name="F_1">**Figure 1</a> | Temporal shift and score compression in evaluations of Marie Skłodowska-Curie Actions postdoctoral fellowships.** **a**, Temporal trend in the percentage of proposals scoring at or above threshold across evaluation panels. The 2025 cohort (yellow) shows a marked divergence from the tightly clustered historical distribution (2018–2024), shifting toward higher scores across all deciles. For example, the 85% ‘Seal of Excellence’ threshold was reached by ~`r dt_long[Score%in%85 & Year == 2025, round(median(applications))]`% of proposals in 2025, compared to ~`r dt_long[Score%in%85 & Year!=2025, round(median(applications))]`% in previous years (medians). n~2018~ = 9,830 applications, n~2019~ = 9,875, n~2020~ = 11,573, n~2021~  = 8,356, n~2022~ = 7,044, n~2023~ = 8,039, n~2024~ = 10,360, n~2025~ = 17,066. **b**, Temporal trend of "excellence saturation", defined as the percentage of proposals achieving a score ≥95%. Data extracted from the [EU Funding & Tenders Portal](https://ec.europa.eu/info/funding-tenders/opportunities/portal/) and available via [@bulla2026bv201].
#'

#+ F_2, out.width='46%', fig.align='left'

# colors
year_cols <- setNames(
  viridis(8, option = "D", direction = 1),
  2018:2025
) #year_cols["2025"]


pal <-c(year_cols["2022"], year_cols["2023"], year_cols["2024"], year_cols["2025"])

# data
dt <- fread(here::here("Data/data_HFSP.csv"))
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
}, by = list(scheme, year_f)]

# plot
p_hfsp <- ggplot(
  ccdf,
  aes(x = Score, y = applications, colour = year_f, group = year_f)
) +
  geom_step(linewidth = 0.6) +
  facet_wrap(~ scheme, nrow = 1, scales = 'free_x') +
  facetted_pos_scales(
    x = list(
      scheme == "Postdoctoral Fellowships" ~
        scale_x_continuous(
          limits = c(40, 100),
          breaks = seq(40, 100, by = 10),
          labels = c("40%", "50%", "60%", "70%", "80%", "90%", ""),
          expand = expansion(mult = 0)
        ),

      scheme == "Research Grants" ~
        scale_x_continuous(
          limits = c(40, 100),
          breaks = seq(40, 100, by = 10),
          labels = c("", "50%", "60%", "70%", "80%", "90%", "100%"),
          expand = expansion(mult = 0)
        )
    )
  ) +
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

  #scale_x_continuous(labels = function(x) ifelse(x == 0, "", paste0(x, "%")), expand = expansion(mult = c(0, 0))) +
  theme_bw(base_size = 7) +
  theme_MB +
  theme(
    #legend.position = c(0.95, 0.95),
    #legend.justification = c(1, 1),
    legend.background = element_rect(fill = scales::alpha("white", 0.7), colour = NA),
    legend.key = element_blank(),
    legend.box.background = element_blank(),

    #plot.margin = margin(t = 4, r = 8)
  )

ggsave(here::here("Output/Fig_2_width-85mm.png"),p_hfsp, width = 8.5, height = 4, units = 'cm')

ggsave(
  here::here("Output/Fig_2_width-85mm.pdf"),
  p_hfsp,
  width = 8.5,
  height = 4,
  units = "cm",
  device = cairo_pdf
)

knitr::include_graphics(here::here("Output/Fig_2_width-85mm.png"))

#' <a name="F_2">**Figure 2</a> | Score distributions in evaluations of Human Frontier Science Program.** Percentage of evaluated full proposals scoring at or above each evaluation-score threshold across application years (2022–2025) and funding schemes (Postdoctoral Fellowships and Research Grants). Proposal scores were originally provided on a 1–10 scale and were transformed to percentages to match the threshold-based representation used in Fig. 1. Score distributions were similar across years and between the two schemes. Postdoctoral Fellowships: n~2022~ = 89 applications at the Full Proposal stage  (out of 393 evaluated Letters of Intent), n~2023~ = 91 (492), n~2024~ = 111 (525), n~2025~ = 117 (663). Research Grants: n~2022~ = 57 (450), n~2023~ = 82 (585), n~2024~ = 65 (669), n~2025~ = 70 (956). Data are available via [@bulla2026bv201].

#' <br />
#'
#' ***
#'
#' # Session info

# Table S1: System session info.
df_session_platform <- devtools::session_info()$platform %>%
  unlist(.) %>%
  as.data.frame(.) %>%
  rownames_to_column(.)

colnames(df_session_platform) <- c("Item", "Value")

df_session_platform %>%
  kbl(
    caption = "Table S1 | System session info.",
    align=c('r', 'l'),
    linesep = "",
    table.attr = 'id="T_S1"'
  ) %>%
  kable_paper(c("striped", "condensed"), full_width = F, position = "left")

# Table S2: Info about used packages.
df_session_packages <- devtools::session_info()$packages %>%
  as.data.frame(.) %>%
  # filter(attached == TRUE) %>%
  dplyr::select(loadedversion, date, source) %>%
  rownames_to_column()

colnames(df_session_packages) <- c("Package", "Loaded version", "Date", "Source")
df_session_packages %>%
  kbl(
    caption = "Table S2 | Info about used packages.",
    align = c("l", "l","l","l"),
    linesep = "",
    table.attr = 'id="T_S2"'
  ) %>%
  kable_paper(c("striped", "condensed"), full_width = F, position = "left") %>%
  scroll_box(height = "650px") #width = "90%",
#'
#' ***
#'
#' # References
