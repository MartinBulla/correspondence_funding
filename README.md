## Data and R-script behind "Can grant evaluation still distinguish scientific excellence?”

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21837111.svg)](https://doi.org/10.5281/zenodo.21837111)

When referring to or reusing these materials, **please cite** the corresponding [preprint](https://doi.org/10.31222/osf.io/d8gcu_v5) and Supporting information [<sup>1</sup>](#1).

### Version history
- [v2.0.1](https://github.com/MartinBulla/correspondence_funding/tree/v2.0.1): Repository version associated with preprint [version 3](https://osf.io/preprints/metaarxiv/d8gcu_v5) and containing expanded documentation of funding-scheme evaluation procedures, PDF figure export, and corresponding [HTML Supporting Information](https://martinbulla.github.io/correspondence_funding/versions/v2.0.1/).
- [v2.0.0](https://github.com/MartinBulla/correspondence_funding/tree/v2.0.0): Repository version associated with preprint [version 2](https://osf.io/preprints/metaarxiv/d8gcu_v2) and corresponding [HTML Supporting Information](https://martinbulla.github.io/correspondence_funding/versions/v2.0.0/).
- [v1.0.0](https://github.com/MartinBulla/correspondence_funding/tree/v1.0.0): Repository version associated with preprint [version 1](https://osf.io/preprints/metaarxiv/d8gcu_v1).
- **Note:** The [main](https://github.com/MartinBulla/correspondence_funding/) branch may contain changes made after the most recent release.


### **Repository contents**

[**HTML Supporting information**](https://martinbulla.github.io/correspondence_funding/versions/v2.0.0/), including code, is generated from the following repository structure:

[Data](Data/) folder stores:

 - [`data_MSCA.csv`](Data/data_MSCA.csv): contains cumulative freely accessible score distributions for the EU *Marie Skłodowska-Curie Actions Postdoctoral Fellowships* for call years 2018-2025. The analyses presented here use the eight Standard/European Fellowship scientific panels (abbreviated as `ST-CHE` = "Chemistry", `ST-ECO` = "Economics", `ST-ENG` = "Informat. & Engineering", `ST-ENV` = "Envi. Sci. & Geosciences", `ST-LIF` = "Life Sciences", `ST-MAT` = "Mathematics", `ST-PHY` = "Physics", `ST-SOC` = "Social Sci. & Humanities").<br><br>
  **The dataset includes the following columns**: `Year` (of the call) and `Score` (0–100%); the remaining columns are abbreviations for each panel and contain percentages of proposals scoring at or above the given `Score`.<br><br>
  The data were aggregated from the [EU Funding & Tenders Portal](https://ec.europa.eu/info/funding-tenders/opportunities/portal/), which contains the official "Flash information on the overall results of the call". These reports are published annually by the European Research Executive Agency following the conclusion of the evaluation process. While individual proposal scores are confidential, these public summaries provide the aggregate percentages of proposals meeting or exceeding specific quality thresholds. The proposals are scored on a scale from 0 to 100%.<br><br>
  **To access the raw reports:** (i) navigate to the EU Funding & Tenders Portal → Funding → Calls for proposals, (ii) in the Quick search field, enter the specific call name (e.g. HORIZON-MSCA-2024-PF-01-01), (iii) look for the data, usually under the "Topic conditions and documents" or "Updates" section.<br><br>
  **Evaluation procedure.** *Marie Skłodowska-Curie Actions Postdoctoral Fellowships* use a single-stage full-proposal evaluation procedure. Applicants submit jointly with a host organisation and select one of eight main scientific evaluation panels (see above). Eligible proposals are evaluated after the call deadline (in September for the 2025 call) by at least three independent external experts against three award criteria: Excellence, Impact, and Quality and efficiency of the implementation, weighted 50%, 30%, and 20%, respectively. Each criterion is scored from 0 to 5 and the weighted scores form the final score on a 0–100 scale. Experts first evaluate proposals independently and then agree on consensus scores and comments. These evaluations are subsequently quality-checked at panel level, where scores may exceptionally be adjusted. Proposals are then ranked within each evaluation panel in descending order of their final total score.<br><br>
  **Scope of analysed data.** The score distributions analysed here therefore represent eligible proposals that underwent this single-stage evaluation procedure, rather than proposals pre-selected through an initial short-proposal stage. Proposals with an overall score of at least 70% are considered positively evaluated; funding then depends on their position in the ranked list and the available budget. We focus on the eight Standard/European Fellowship scientific panels because they provide the largest and most comparable series across years. The dataset also contains Global Fellowship panels (GF-*) and, for earlier Horizon 2020 calls, the Career Restart (CAR), Reintegration (RI) and Society & Enterprise (SE) panels; these represent distinct fellowship modalities or special-purpose panels and were therefore not included in the analyses.

 - [`data_HFSP.csv`](Data/data_HFSP.csv): contains non-public, anonymized proposal-level evaluation-score data kindly provided by the [*Human Frontier Science Program*](https://www.hfsp.org) (HFSP) for evaluated Full Proposals submitted to the [Postdoctoral Fellowships](https://www.hfsp.org/funding/hfsp-funding/postdoctoral-fellowships) and [Research Grants](https://www.hfsp.org/funding/hfsp-funding/research-grants) schemes for 2022–2025.<br><br>
   **The provided dataset includes the following columns**: `scheme`:  funding scheme (Postdoctoral Fellowships or Research Grants), `year`:  award year of the call (2022–2025), `rank`: rank of the Full Proposal within the given `scheme` and `year`, `score`: final evaluation score assigned by the Review Committee (1-10).<br><br>
   We transformed the scores into percentages, with 10 representing 100%, and, to match Fig. 1, calculated the percentage of evaluated proposals scoring at or above each percentage threshold.<br><br>
  **Evaluation procedure.** The Human Frontier Science Program uses a two-stage evaluation procedure. Applicants first submit a short Letter of Intent (deadline in spring), which is evaluated by a scheme-specific Review Committee of ~25 members. Each Letter is assessed independently by two reviewers, with individual reviewers typically evaluating 30–70 applications. Letters receive categorical ratings from A to D; reviewers are given approximate guidance on the expected distribution of ratings to reduce differences in scoring tendencies among reviewers.<br><br>
  Each year, a roughly similar number of applicants are shortlisted and invited to submit a Full Proposal. At this stage, each proposal is evaluated in detail by three Review Committee members, with each member assigned approximately 10–15 proposals. The assigned reviewers present their assessments during the committee meeting. Following discussion, committee members assign numerical scores on a 1–10 scale, and the resulting mean score is used to rank proposals.<br><br>
  **Scope of analysed data.** The score distributions analysed here therefore represent only shortlisted applications that advanced to the Full Proposal stage, not the full applicant pool. Note that the Postdoctoral Fellowships data include applications to the Long-Term Fellowships scheme, for applicants with a PhD in a biological discipline who wish to undertake a novel, frontier project in the life sciences, but not applications to the Cross-Disciplinary Fellowships scheme, which makes only approximately five awards per year. Similarly, the Research Grants data include applications to the Program scheme, but not to the Early Career scheme, which usually makes fewer than 10 awards per year.

[**R**](R/) folder stores scripts used in the analysis:
 - [`_runRmarkdown.R`](R/_runRmarkdown.R) generates the [HTML Supporting information](https://martinbulla.github.io/correspondence_funding/versions/v2.0.1/) from [`HTML.R`](R/HTML.R).
 - [`HTML.R`](R/HTML.R) is the script behind the [HTML Supporting information](https://martinbulla.github.io/correspondence_funding/versions/v2.0.1/), containing all code used to generate the paper outputs.

[**Output**](Output/) folder stores separate files of all outputs used in the manuscript:
 - [HTML.html](Output/HTML.html)
 - [Fig_1.png](Output/Fig_1_width-185mm.png)
 - [Fig_1.pdf](Output/Fig_1_width-185mm.pdf)
 - [Fig_2.png](Output/Fig_2_width-85mm.png)
 - [Fig_2.pdf](Output/Fig_2_width-85mm.pdf)

[**Resources**](Resources) folder stores:
 - [`_bib.bib`](Resources/_bib.bib) bibliography used in the [HTML Supporting information](https://martinbulla.github.io/correspondence_funding/versions/v2.0.1/).
 - [`styles.css`](Resources/styles.css) defines graphical parameters for the [HTML Supporting information](https://martinbulla.github.io/correspondence_funding/versions/v2.0.1/) generation.

[**versions**](versions/) stores immutable release-specific HTML Supporting Information.

### License and reuse

*Author-generated materials* in this repository, including collated data, derived data, scripts, figures, outputs and HTML, are licensed under the Creative Commons Attribution 4.0 International License [CC-BY-4.0](LICENSE).

***

<a name="1"></a>(1) Martin Bulla & Peter Mikula (2026). *Supporting information for 'Can grant evaluation still distinguish scientific excellence?'*, GitHub, https://martinbulla.github.io/correspondence_funding/versions/v2.0.0/; [doi:10.5281/zenodo.21837112](https://doi.org/10.5281/zenodo.21837112).
