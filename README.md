**Current version:** v2.0.0

## Data and R-script behind "Can grant evaluation still distinguish scientific excellence?”

When referring to or reusing these materials, **please cite** the corresponding [preprint](https://doi.org/10.31222/osf.io/d8gcu_v1) and this repository [<sup>1</sup>](#1).

### **Repository contents**

[**HTML Supporting information**, including code](https://martinbulla.github.io/correspondence_funding) is generated from the following repository structure:

[Data](https://github.com/MartinBulla/correspondence_funding/tree/main/Data/) folder stores:

 - [`data_MSCA.csv`](https://github.com/MartinBulla/correspondence_funding/blob/main/Data/data_MSCA.csv): contains cumulative score distribution for the EU *Marie Skłodowska-Curie Actions Postdoctoral Fellowships* for 2018-2025 and each evaluation panel (abbreviated as "ST-CHE" = "Chemistry", "ST-ECO" = "Economics", "ST-ENG" = "Informat. & Engineering", "ST-ENV" = "Envi. Sci. & Geosciences" "ST-LIF" = "Life Sciences", "ST-MAT" = "Mathematics", "ST-PHY" = "Physics", "ST-SOC" = "Social Sci. & Humanities") and year of the call, with the following columns: `Year` (of the call) and `Score` (threshold); the remaining columns are abbreviations for each panel and contain percentages of proposals scoring at or above given `Score`.

  The data were aggregated from the [EU Funding & Tenders Portal](https://ec.europa.eu/info/funding-tenders/opportunities/portal/), which contains the official "Flash information on the overall results of the call". These reports are published annually by the European Research Executive Agency following the conclusion of the evaluation process. While individual project scores are confidential, these public summaries provide the aggregate percentages of proposals meeting or exceeding specific quality thresholds. The proposals are scored between 0 and 100%. **To access the raw reports**: (i) navigate to the EU Funding & Tenders Portal and go to Calls for proposal, (ii) search for the specific call (e.g. HORIZON-MSCA-2024-PF-01-01), (iii) look for the data, usually under the "Topic conditions and documents" or "Updates" section.

  *Marie Skłodowska-Curie Actions Postdoctoral Fellowships* are evaluated as full proposals submitted jointly by the researcher and host organisation through the EU Funding & Tenders Portal. Eligible proposals are assessed after the call deadline (September, in case of 2025) by at least three independent external experts against the *Marie Skłodowska-Curie Actions* award criteria: Excellence, Impact, and Quality and Efficiency of Implementation. Experts first evaluate proposals individually and then agree on consensus scores and comments, which form the basis of the Evaluation Summary Report and final ranking. The *Marie Skłodowska-Curie Actions* score distributions analysed here therefore represent eligible full proposals evaluated through this single-stage full-proposal procedure, rather than applications pre-selected through an initial short-proposal stage.

 - [`data_HFSP.csv`](https://github.com/MartinBulla/correspondence_funding/blob/main/Data/data_HFSP.csv): contains year, rank and score (0-10) of [Research Grant](https://www.hfsp.org/funding/hfsp-funding/research-grants) proposals, written by the applicants invited to write full-blast proposals. Such data are not publicly available, but were kindly provided by [Human Frontiers Science Program](https://www.hfsp.org) for calls with 2024 and 2025 deadlines. We then transformed the scores into percentages (10 representing 100% percent) and to mimic Fig. 1 data, calculated the percentage of evaluated proposals scoring >= each percentage threshold.

  Human Frontiers Science Program evaluates the Postdoctoral Fellowships through a staged procedure. Applicants first submit a short Letter of Intent (deadline in May), from which the review committee selects candidates invited to submit a full proposal (deadline in September). The score distributions analysed here therefore represent only shortlisted applications that proceeded to full evaluation, not the full applicant pool.

[**R**](https://github.com/MartinBulla/correspondence_funding/tree/main/R) folder stores scripts used in the analysis:
 - [`_runRmarkdown.R`](https://github.com/MartinBulla/correspondence_funding/blob/main/R/_runRmarkdown.R) generates the HTML [Supporting information](https://martinbulla.github.io/correspondence_funding/) from [`HTML.R`](https://github.com/MartinBulla/correspondence_funding/blob/main/R/HTML.R).
 - [`HTML.R`](https://github.com/MartinBulla/correspondence_funding/blob/main/R/HTML.R) is the script behind the [HTML](https://martinbulla.github.io/correspondence_funding/), containing all code used to generate the paper outputs.

[**Output**](https://github.com/MartinBulla/correspondence_funding/tree/main/Output) folder stores separate files of all outputs used in the manuscript:
 - [HTML](https://github.com/MartinBulla/correspondence_funding/blob/main/Output/HTML.html)
 - [Fig_1.png](https://github.com/MartinBulla/correspondence_funding/blob/main/Output/Fig_1_width-185mm.png)
 - [Fig_2.png](https://github.com/MartinBulla/correspondence_funding/blob/main/Output/Fig_2_width-60mm.png)

[**Resources**](https://github.com/MartinBulla/correspondence_funding/tree/main/Resources) folder stores:
 - [`_bib.bib`](https://github.com/MartinBulla/correspondence_funding/blob/main/Resources/_bib.bib) bibliography used in the [HTML](https://martinbulla.github.io/correspondence_funding/).
 - [`styles.css`](https://github.com/MartinBulla/correspondence_funding/blob/main/Resources/styles.css) defines graphical parameters for the HTML generation.

### License and reuse

*Author-generated materials* in this repository, including collated data, derived data, scripts, figures, outputs and HTML, are licensed under the Creative Commons Attribution 4.0 International License [CC-BY-4.0](https://github.com/MartinBulla/correspondence_funding/blob/main/LICENSE).

### Version history
 - v1.0.0: The first public release of the [`correspondence_funding`](https://github.com/MartinBulla/correspondence_funding/) repository, archived for reproducibility of the first preprint version.
 - v2.0.0: Archived for reproducibility of the second preprint version.

***

<a name="1"></a>(1) Martin Bulla & Peter Mikula (2026). *Supporting information for 'Can grant evaluation still distinguish scientific excellence?'*, GitHub, [https://github.com/MartinBulla/correspondence_funding](https://github.com/MartinBulla/correspondence_funding)
