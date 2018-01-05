# Regex Lab

In this lab you'll build a spam classification model using Logistic Regression and **ONLY** features derived from regular expressions.

For example, a lot of spam messages reference a price, so a good feature would be the following:

```python
df['message'].str.contains('[$£€]').astype(int)
```
The `df['message'].str.contains('[$£€]')` is checking for a dollar sign (`$`), the British pound sign (`£`) or the Euro sign (`€`). It will return a pandas' `Series` object of boolean values.

The `.astype(int)` method converts those booleans into 1s and 0s, so that they can be fed into a model.


## Notes
1. I want you to get some practice building out a `Pipeline` (using `FeatureUnion` and `FunctionTransformer`) in `sklearn`, and have added some starter code on how to get that to work.
2. See how high an accuracy score you can get using `cross_val_score` with one caveat: You can't tune your `LogisticRegression` model.
