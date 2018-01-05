# Joining with Pandas

Time for some practice in concatenating and merging with pandas. In this repo there are several CSVs. Your job is to combine them to form a single data frame in pandas.

In the Jupyter notebook provided, perform the following tasks:

## Step 1
Combine `states-a.csv` (Alabama-Missouri) and `states-b.csv` (Montana-Wyoming) into a single dataframe containing all 50 states.

## Step 2
Combine `state-abbreviations.csv` and `state-capitals.csv` with your dataframe using pandas `merge` method.

## Step 3
Set the index of your dataframe to be the `'State'` column.

Load `state-facts.csv` into a separate dataframe and set its index to be the `'State'` column.

Merge the two dataframes together using pandas' `concat` method.

## Attribution

Information on states was gathered from [Wikipedia](https://en.wikipedia.org/wiki/List_of_capitals_in_the_United_States#State_capitals).
