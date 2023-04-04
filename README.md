## 📝 Table of Contents
- [Problem Statement](#problem_statement)
- [Getting Started](#getting_started)
- [General Comments](#general_comments)

## 🧐 Problem Statement <a name = "problem_statement"></a>
Perform Analysis on [Orders](https://github.com/konschri/ef_assessement/blob/main/Part2/orders.csv) file.
  
Part 1 focuses on SQL queries:  
- To compare "Breakfast" cuisine versus the total based on metrics: **Basket**, **Frequency**, **%Users that exceed 3 orders**
- To find the percentage of orders that top 10 users of each city contribute to their city  

Part 2 focuses on:  
- Customer segmentation based on their frequency and order value
- Target group definition to promote "Breakfast" cuisine

Part 3 focuses on:  
- Suggesting improvements on the existing layout of given dashboard
- Explaining the outcome of the slides

## 🏁 Getting Started <a name = "getting_started"></a>
The solution for Part 2 is provided in a jupyter notebook file.
All you need to do in case you want to replicate the results is to install [requirements](https://github.com/konschri/ef_assessement/blob/main/requirements.txt). This can be done by:  
```
pip install -r requirements.txt. 
```
Afterwards you can just change your directory to Part2 folder and launch the notebook.

## ✍️ General comments <a name = "general_comments"></a>
For Part1 the Q1 is provided in two different approaches. The first [query](https://github.com/konschri/ef_assessement/blob/main/Part1/efood_Q1.sql)
is a unified solution for calculating all three metrics at once. Being somewhat ugly and not easily readable, 
a second [solution](https://github.com/konschri/ef_assessement/blob/main/Part1/efood_Q1_split.sql)
is available that calculates the metrics piecemeal.

For Part2 besided the code there is also a [presentation](https://github.com/konschri/ef_assessement/blob/main/Part2/E-food%20Insights%20Analyst%20Exercise.pptx) of findings 
that summarizes the key points extracted by the notebook
