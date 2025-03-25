# Internal Controls and qPCR-Based Predictive Modelling Improve Metagenomic Sequencing Coverage in HIV Protocols

This repository contains all supplementary data and analysis scripts associated with the study:

**"Internal Controls and qPCR-Based Predictive Modelling Improve Metagenomic Sequencing Coverage in HIV Protocols"**  
*Juan Monteiro da Silva, David Bonsall, George McIntyre-Cockett, Nicholas Grayson*

---

## 🧬 Overview

This study proposes a qPCR-informed metagenomic protocol to estimate HIV viral loads using an internal control (Mengovirus) and sequencing-derived metrics. A multiple linear regression model based on ΔCt values significantly improved the predictive accuracy of sequencing-derived viral loads.

The repository includes:

- qPCR datasets and standard curves  
- Mengovirus primer performance metrics  
- Correlation and regression analyses  
- Figures and tables referenced in the article  
- Python scripts for qPCR analysis, ΔCt modelling, and visualisations  

---

## 📊 Key findings

- RNA qPCR predicted clinical HIV viral load with R² = 0.66  
- Library qPCR alone had weaker predictive power (R² = 0.61)  
- ΔCt-based modelling improved library-based prediction to R² = 0.76  
- Mengovirus is an effective internal control for sequencing-based quantification  

---

## 🔁 Reproducibility

All scripts were written in **Python 3.10.12** using:

- pandas, numpy, statsmodels, scipy, seaborn, matplotlib

To install the dependencies:

```bash
pip install -r requirements.txt
```

Or use the virtual environment in `env/` (if provided).

---

## 📄 Citation

If you use this repository, please cite the manuscript once published:

> Monteiro da Silva J, Bonsall D, McIntyre-Cockett G, Grayson N.  
> *Internal Control–Based ΔCt Modelling Enhances HIV Viral Load Estimation from Metagenomic Libraries*.  
> *Microbial Genomics*, 2025.

---

## 📬 Contact

For questions or collaboration inquiries:

- juan.monteiro@outlook.com  
- juan.monteiro@reuben.ox.ac.uk  

---

## 📘 License

This repository is shared under the **MIT License**. See [`LICENSE`](LICENSE) for details.
