## Data and R-script behind "Can grant evaluation still distinguish scientific excellence?”

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21837111.svg)](https://doi.org/10.5281/zenodo.21837111)

When referring to or reusing these materials, **please cite** the corresponding [preprint](https://doi.org/10.31222/osf.io/d8gcu_v2) and Supporting information [<sup>1</sup>](#1).

### Version history
- [v2.0.0](https://github.com/MartinBulla/correspondence_funding/tree/v2.0.0): Repository version associated with preprint [version 2](https://osf.io/preprints/metaarxiv/d8gcu_v2) and corresponding [HTML Supporting Information](https://martinbulla.github.io/correspondence_funding/versions/v2.0.0/).
- [v1.0.0](https://github.com/MartinBulla/correspondence_funding/tree/v1.0.0): Repository version associated with preprint [version 1](https://osf.io/preprints/metaarxiv/d8gcu_v1).
- **Note:** The [main](https://github.com/MartinBulla/correspondence_funding/) branch may contain changes made after the most recent release.


### **Repository contents**

[**HTML Supporting information**](https://martinbulla.github.io/correspondence_funding/versions/v2.0.0/), including code, is generated from the following repository structure:

[Data](Data/) folder stores:

 - [`data_MSCA.csv`](Data/data_MSCA.csv): contains cumulative score distributions for the EU *Marie Skłodowska-Curie Actions Postdoctoral Fellowships* for each evaluation panel (abbreviated as "ST-CHE" = "Chemistry", "ST-ECO" = "Economics", "ST-ENG" = "Informat. & Engineering", "ST-ENV" = "Envi. Sci. & Geosciences", "ST-LIF" = "Life Sciences", "ST-MAT" = "Mathematics", "ST-PHY" = "Physics", "ST-SOC" = "Social Sci. & Humanities") and call year (2018–2025), with the following columns: `Year` (of the call) and `Score` (0–100%); the remaining columns are abbreviations for each panel and contain percentages of proposals scoring at or above the given `Score`.<br><br>
  The data were aggregated from the [EU Funding & Tenders Portal](https://ec.europa.eu/info/funding-tenders/opportunities/portal/), which contains the official "Flash information on the overall results of the call". These reports are published annually by the European Research Executive Agency following the conclusion of the evaluation process. While individual project scores are confidential, these public summaries provide the aggregate percentages of proposals meeting or exceeding specific quality thresholds. The proposals are scored on a scale from 0 to 100%.<br><br>
  To access the raw reports: (i) navigate to the EU Funding & Tenders Portal → Funding → Calls for proposals, (ii) in the Quick search field, enter the specific call name (e.g. HORIZON-MSCA-2024-PF-01-01), (iii) look for the data, usually under the "Topic conditions and documents" or "Updates" section.<br><br>
  *Marie Skłodowska-Curie Actions Postdoctoral Fellowships* are evaluated as full proposals submitted jointly by the researcher and host organisation through the EU Funding & Tenders Portal. Eligible proposals are assessed after the call deadline (in September for the 2025 call) by at least three independent external experts against the *Marie Skłodowska-Curie Actions* award criteria: Excellence, Impact, and Quality and Efficiency of Implementation. Experts first evaluate proposals individually and then agree on consensus scores and comments, which form the basis of the Evaluation Summary Report and final ranking. The *Marie Skłodowska-Curie Actions* score distributions analysed here therefore represent eligible full proposals evaluated through this single-stage full-proposal procedure, rather than applications pre-selected through an initial short-proposal stage.

 - [`data_HFSP.csv`](Data/data_HFSP.csv): contains anonymized evaluation-score data for Full Proposals submitted to the [Postdoctoral Fellowships](https://www.hfsp.org/funding/hfsp-funding/postdoctoral-fellowships) and [Research Grants](https://www.hfsp.org/funding/hfsp-funding/research-grants) schemes of the [*Human Frontier Science Program*](https://www.hfsp.org) for 2022–2025, with the following columns: `scheme` (funding scheme), `year` (of the call), `rank` (of the application in the given scheme and year) and `score` (evaluation score; 1–10).<br><br>
  These non-public data were kindly provided by the *Human Frontier Science Program*. We transformed the scores into percentages, with 10 representing 100%, and, to match Fig. 1, calculated the percentage of evaluated proposals scoring at or above each percentage threshold.<br><br>
  The Human Frontier Science Program evaluates both schemes through a two-stage procedure. Applicants first submit a short Letter of Intent (deadline in spring), on the basis of which scheme-specific committees select applicants invited to submit a Full Proposal (deadline in September). The score distributions analysed here therefore represent only shortlisted applications that advanced to the Full Proposal stage, not the full applicant pool.<br><br>
  Note that the Postdoctoral Fellowships data include applications to the Long-Term Fellowships scheme, for applicants with a PhD in a biological discipline who wish to undertake a novel, frontier project in the life sciences, but not applications to the Cross-Disciplinary Fellowships scheme, which makes only approximately five awards per year. Similarly, the Research Grants data include applications to the Program scheme, but not to the Early Career scheme, which usually makes fewer than 10 awards per year.

[**R**](R/) folder stores scripts used in the analysis:
 - [`_runRmarkdown.R`](R/_runRmarkdown.R) generates the [HTML Supporting information](https://martinbulla.github.io/correspondence_funding/versions/v2.0.0/) from [`HTML.R`](R/HTML.R).
 - [`HTML.R`](R/HTML.R) is the script behind the [HTML Supporting information](https://martinbulla.github.io/correspondence_funding/versions/v2.0.0/), containing all code used to generate the paper outputs.

[**Output**](Output/) folder stores separate files of all outputs used in the manuscript:
 - [HTML.html](Output/HTML.html)
 - [Fig_1.png](Output/Fig_1_width-185mm.png)
 - [Fig_1.pdf](Output/Fig_1_width-185mm.pdf)
 - [Fig_2.png](Output/Fig_2_width-85mm.png)
 - [Fig_2.pdf](Output/Fig_2_width-85mm.pdf)

[**Resources**](Resources) folder stores:
 - [`_bib.bib`](Resources/_bib.bib) bibliography used in the [HTML Supporting information](https://martinbulla.github.io/correspondence_funding/versions/v2.0.0/).
 - [`styles.css`](Resources/styles.css) defines graphical parameters for the [HTML Supporting information](https://martinbulla.github.io/correspondence_funding/versions/v2.0.0/) generation.

[**versions**](versions/) stores immutable release-specific HTML Supporting Information.

### License and reuse

*Author-generated materials* in this repository, including collated data, derived data, scripts, figures, outputs and HTML, are licensed under the Creative Commons Attribution 4.0 International License [CC-BY-4.0](LICENSE).

***

<a name="1"></a>(1) Martin Bulla & Peter Mikula (2026). *Supporting information for 'Can grant evaluation still distinguish scientific excellence?'*, GitHub, https://martinbulla.github.io/correspondence_funding/versions/v2.0.0/; [doi:10.5281/zenodo.21837112](https://doi.org/10.5281/zenodo.21837112).

