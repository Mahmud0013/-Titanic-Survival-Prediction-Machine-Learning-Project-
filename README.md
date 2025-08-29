# 🚢 Titanic Survival Prediction (Machine Learning Project)

## 📌 Overview
This project applies **machine learning** to the famous **Titanic dataset** from [Kaggle](https://www.kaggle.com/c/titanic).  
The goal is to predict whether a passenger survived (1) or not (0) based on socio-demographic and travel-related attributes.

This repository contains:
- Data preprocessing and cleaning steps
- Exploratory Data Analysis (EDA)
- Logistic Regression model as a baseline
- Prediction and submission file generation for Kaggle

---

## 📂 Dataset
The dataset is provided by Kaggle and includes three files:

- `train.csv` – Passenger features + survival outcome (`Survived`)
- `test.csv` – Passenger features without outcome
- `gender_submission.csv` – Example submission file (baseline: all females survived)

### Features
- **Survived** (Target variable: 0 = No, 1 = Yes)
- **Pclass** (Passenger class: 1st, 2nd, 3rd)
- **Sex** (Male/Female)
- **Age**
- **SibSp** (Siblings/Spouses aboard)
- **Parch** (Parents/Children aboard)
- **Fare**
- **Embarked** (C = Cherbourg, Q = Queenstown, S = Southampton)

---

## ⚙️ Project Workflow
1. **Data Preprocessing**
   - Handle missing values (`Age`, `Fare`, `Embarked`)
   - Convert categorical variables (`Sex`, `Embarked`) to factors
2. **Exploratory Data Analysis (EDA)**
   - Survival rate by gender, class, and age
   - Insights: Women, children, and wealthier passengers had higher survival rates
3. **Model Development**
   - Logistic Regression (baseline)
   - Model formula:  
     ```
     Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked
     ```
4. **Prediction**
   - Generate predictions on test set
   - Convert probabilities > 0.5 into binary outcomes (0/1)
5. **Submission**
   - Save results in `my_submission.csv` for Kaggle submission

---

## 📊 Results
- Logistic Regression accuracy on Kaggle: **~77–79%**
- Baseline (`gender_submission.csv`) accuracy: ~76%
- Significant predictors:
  - **Sex (male)** → Strong negative effect
  - **Pclass** → Higher class increased survival odds
  - **Age** → Older passengers less likely to survive
  - **Fare** → Higher fares slightly increased survival odds

---

## 🚀 Future Improvements
- Feature engineering (e.g., family size, passenger titles, cabin deck)
- Use advanced models (Random Forest, Gradient Boosting, XGBoost)
- Apply cross-validation for better evaluation

---

## 📁 Repository Structure
```
├── train.csv
├── test.csv
├── gender_submission.csv
├── Titanic_ML_Project_Report.docx   # Detailed project report
├── my_submission.csv                # Kaggle submission file
├── titanic_model.R                  # R script for model building
└── README.md                        # This file
```

---

## 🛠️ Technologies Used
- **R** (tidyverse, caret, rpart, randomForest)
- **Kaggle Titanic dataset**

---

## 📜 License
This project is open-source and available under the MIT License.
