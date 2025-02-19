# 📊 HR Data Cleaning & EDA Project

## 📌 Project Overview
This project focuses on **cleaning and analyzing HR data** using **SQL and Python**. We preprocess the dataset by handling missing values, correcting data inconsistencies, and performing **Exploratory Data Analysis (EDA)** to extract meaningful insights.

## 📂 Dataset
We used the **HR Employee Dataset**, which contains details about employees, including:
- **Employee Information:** ID, Name, Age, Gender, Department, Salary, Experience, etc.
- **Employment Details:** Hiring Date, Termination Reason, Performance Score, Absences, etc.

📥 **Dataset File:** `hrdataset_v14.csv` (included in this repository)
📂 **SQL Import File:** `hrdataset_v14.sql` (to import in MySQL Workbench)

---
## 🛠 Data Cleaning Process
We performed **data cleaning** using SQL and Pandas, including:

✅ **Handling Missing Values**  
Checked for NULL values and handled them appropriately.

✅ **Standardizing Data**  
- Converted `Sex` values (`M`, `male`, `m`) to `Male`.
- Standardized `EmploymentStatus` values.

✅ **Removing Duplicates**  
- Identified and removed duplicate records.

✅ **Fixing Date Formats**  
- Converted `DateofHire` and `DateofTermination` to the correct format (`YYYY-MM-DD`).

---
## 📊 Exploratory Data Analysis (EDA)
We used **Seaborn and Matplotlib** for visualizing:

📌 **Termination Analysis:** Which department has the highest terminations?  
📌 **Salary Distribution:** Are salaries fairly distributed across departments?  
📌 **Performance vs Absenteeism:** Do employees with high absenteeism have low performance?  

🔍 **Key SQL Queries Used:**
```sql
-- Checking missing values
SELECT column_name, COUNT(*) - COUNT(column_name) AS missing_values
FROM hrdataset_v14
GROUP BY column_name;

-- Standardizing Gender Data
UPDATE hrdataset_v14 SET Sex = 'Male' WHERE Sex IN ('M', 'male', 'm');
```

📊 **Key Python Visualizations Used:**
```python
# Termination count per department
sns.barplot(y=termination_counts['Department'], x=termination_counts['EmpID'], palette='Reds_r')
plt.title('Terminations per Department')
plt.show()
```

---
## 🚀 How to Run This Project

### 🔹 SQL (MySQL Workbench)
1️⃣ Open **MySQL Workbench**.  
2️⃣ Import `hrdataset_v14.sql`.  
3️⃣ Run queries to clean and analyze the data.  

### 🔹 Python (Jupyter Notebook / VS Code)
1️⃣ Install dependencies: `pip install pandas numpy seaborn matplotlib`  
2️⃣ Load the dataset: `data = pd.read_csv('hrdataset_v14.csv')`  
3️⃣ Perform data cleaning and EDA.  

---
## 📌 Repository Structure
```
📂 HR-Data-Cleaning-EDA/
├── 📜 README.md            # Project Documentation
├── 📂 data/
│   ├── hrdataset_v14.csv   # Raw Dataset
│   ├── hrdataset_v14.sql   # SQL Import File
├── 📂 notebooks/
│   ├── data_cleaning.ipynb # Data Cleaning and Exploratory Data Analysis in python 
├── 📂 sql_queries/
│   ├── data_cleaning.sql # SQL queries for cleaning and for data analysis
```

---
## 🏆 Business Insights
🔹 The **Sales** department had the highest terminations.  
🔹 Employees with **high absenteeism** showed lower performance scores.  
🔹 Salary distribution across departments was **unequal**, with **higher salaries in IT**.  

---
## 📢 Contributing
Feel free to fork this project, raise issues, and contribute improvements! 🚀  

### 🌟 If you found this useful, give it a ⭐ on GitHub!

