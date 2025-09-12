Forecasting Customer Financial Behavior using LSTM
📌 Overview

This project explores the use of deep learning models (LSTM/GRU) to forecast customer financial behavior, such as income changes, balance depletion, and potential financial stress.

Banks and financial institutions face challenges in scaling forecasting models from segment-level insights (e.g., age groups, income tiers) to millions of individualized customer forecasts. This project simulates that trade-off by comparing traditional time series models with advanced neural network approaches.

🎯 Goals

Segment-Level Forecasting (Baseline)

Create time-indexed series grouped by customer segments (e.g., income tier, age group).

Apply ARIMA, Exponential Smoothing, and Prophet models.

Visualize and evaluate baseline forecasting performance.

Customer-Level Forecasting with LSTM/GRU

Engineer time-series sequences per customer (e.g., past N months of balances or income).

Train LSTM/GRU models across customer-level sequences.

Compare predictive accuracy and generalization against baseline models.

📊 Dataset

Due to limitations in sharing private banking data, this project leverages public datasets. For example:

Bank Customer Transaction Analysis (Kaggle)

Data includes transaction-level and balance-level information that can be aggregated for forecasting tasks.

Data Type: Time series (balances, income, transactions)

Focus: Checking and savings products (extendable to other customer-level data)

🛠️ Methodology

Data Collection & Preprocessing

Scraping (API-based if applicable)

Cleaning, normalization, and feature engineering

Handling missing data and outliers

Exploratory Data Analysis (EDA)

Visualization of financial behavior trends

Segment analysis for baseline forecasting

Modeling

Phase 1: Segment-level forecasting with ARIMA, Exponential Smoothing, Prophet

Phase 2: Customer-level forecasting with LSTM/GRU

Accuracy comparison against baseline models

🚀 Expected Outcome

A validated LSTM model capable of forecasting individualized customer behavior.

Benchmark comparisons between statistical models and deep learning approaches.

Visual dashboards to illustrate segment-level and customer-level forecasts.

📚 Skills & Domains

Statistics & Time Series Analysis

Deep Learning (LSTM/GRU)

Finance & Economics Applications

Data Preprocessing & Visualization

👩‍💻 Project Mentors

TD Bank (Industry Affiliate)
