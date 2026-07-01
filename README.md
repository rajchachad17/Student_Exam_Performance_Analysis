# 📊 Student Exam Performance Analysis

A complete end-to-end data analysis project exploring the factors that influence student exam performance — from raw data collection to SQL querying and interactive Power BI dashboards.

---

## 📁 Project Structure

```
Student-Exam-Performance-Analysis/
│
├── data/
│   ├── raw/
│       └── Student_Performance_Factors_raw_data.csv          # Original dataset
│
│   └── processed/
│       ├── Student_Performance_Factors_clean_data.csv        # Cleaned & preprocessed data
│       └── Student_Performance_Factors_excel_engineered.xlsx # Excel pivot analysis
│
├── Student_Exam_Performance_Analysis.ipynb               # Main Python Notebook
├── Student_Performance_Analysis.sql                      # MySQL queries
├── Student_Performance_Analysis.pbix                     # Power BI dashboard
├── assets/
│   └── dashboard.jpeg
└── README.md
```

---

## 🎯 Project Objective

To analyze the key academic, behavioral, and socioeconomic factors that affect student exam scores — and to classify students into performance tiers based on their results.

---

## 📦 Dataset

- **Source:** Kaggle
- **Raw Records:** 6,607 rows × 21 columns
- **Key Features:** Exam Score, Attendance, Hours Studied, Motivation Level, Tutoring Sessions, Parental Involvement, Family Income, and more

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Python (Pandas, NumPy) | Data Cleaning & Preprocessing |
| Google Colab | Development Environment |
| Microsoft Excel | Pivot Tables & Exploratory Analysis |
| MySQL + MySQL Workbench | SQL Query-Based Analysis |
| Power BI | Data Visualization & Dashboard |

---

## 🔄 Project Workflow

### Phase 1 — Data Collection
- Downloaded the Student Performance Factors dataset from Kaggle
- Loaded raw CSV into Google Colab using Pandas

---

### Phase 2 — Data Cleaning (Python)
- **Dropped unnecessary columns** — rearranged and retained only the 21 relevant attributes
- **Removed duplicates** — identified and dropped all duplicate rows
- **Identified primary attributes** — selected key columns for analysis
- **Handled missing values:**

| Column | Strategy |
|---|---|
| `Exam_Score` | Dropped rows with nulls (critical target variable) |
| `Attendance` | Dropped rows with nulls (key feature) |
| `Hours_Studied` | Dropped rows with nulls (key feature) |
| `Previous_Scores` | Filled with **median** value |
| `Motivation_Level` | Filled with `"Unknown"` |
| `Tutoring_Sessions` | Filled with `0` |

---

### Phase 3 — Data Preprocessing (Python)
- **Engineered `Performance_Level` column** — categorized students based on Exam Score:

```python
def performance_level(score):
    if score >= 75:
        return "Top Performer"
    elif score >= 50:
        return "Average Performer"
    else:
        return "Weak Performer"
```

- **Engineered `Score_per_Hour` column** — calculated efficiency metric:

```python
df['Score_per_Hour'] = df['Exam_Score'] / df['Hours_Studied']
```

---

### Phase 4 — Data Preprocessing (Excel)
- Loaded cleaned data into Microsoft Excel
- Added category-based columns for grouping
- Built **Pivot Tables** and **Pivot Charts** to explore distributions and trends visually

---

### Phase 5 — SQL Query-Based Analysis (MySQL)

Imported the cleaned dataset into MySQL and performed structured query analysis.

**Key queries performed:**

```sql
-- Distribution of students across performance levels
SELECT Performance_Level, COUNT(*) AS student_count
FROM students
GROUP BY Performance_Level;

-- Average exam score overall
SELECT AVG(Exam_Score) AS Avg_Exam_Score FROM students;

-- Attendance pattern by performance level
-- Study hours comparison: Top vs Weak performers
-- Impact of tutoring sessions on exam score
-- Impact of motivation level on exam score

```

---

### Phase 6 — Data Visualization (Power BI)
- Built an interactive Power BI dashboard using the cleaned dataset
- Visualized performance distribution, attendance trends, study hours, and motivation impact
- Used slicers for filtering by Gender, School Type, Family Income, and more

---

## 💡 Key Insights

- **Top Performers** consistently show higher attendance and more study hours compared to Weak Performers
- **More tutoring sessions** correlate with higher average exam scores
- **High motivation level** students outperform Low motivation students on average
- **Score per Hour** metric reveals efficiency differences across performance groups

---


## 👤 Author

**Rajvardhan Chachad**
GitHub: [@rajchachad17](https://github.com/rajchachad17)
