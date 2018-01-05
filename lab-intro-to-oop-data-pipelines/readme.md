# Intro to Object Oriented Programming and Data Pipelines Lab

This lab is very open-ended and ties directly into Project 3 (which is due tomorrow!)

Your task is to:
1. Create a new Jupyter Notebook in this folder
2. Import `train.csv`, split `SalePrice` or `Sale Condition` into their own series (your choice), and perform a train-test split.
3. Look at your current code for Project 3's regression and classification challenges.
4. Pick at least three (more is welcome!) data transformations that you are currently doing in your current version of code.
5. Refactor your chosen data transformations, ending with your current model and hyperparameters, using `Pipeline` and `FeatureUnion` to create a reproducible object. 
> This step is in essence asking you to rewrite some of your current Project 3 work here, refactoring it to use `Pipeline` and `FeatureUnion`. This is not part of your Project 3 submission, but is a chance to continue engaging with that material while also practicing the skills learned this morning. You do not need to refactor your entire model and data transformations for this lab (and that would likely be a larger undertaking than the 3 hours for this lab anyway!)
6. Fit your pipeline to the training data and test it on the test data created in step 2. Does this perform similarly to your Project 3 work?

**Note**: This lab is designed to be fairly short in order to give you more time to work on Project 3, if necessary. However, while having one `Pipeline` object with three features and a model is the requirement for this lab, we encourage you to continue working on this lab for the full amount of time if possible. Hacking away at the sklearn library is a great way to become familiar with how it works!

The two custom classes we created this morning are posted below in case you'd like to make use of them:

```python
from sklearn.base import BaseEstimator, TransformerMixin

class FeatureExtractor(BaseEstimator, TransformerMixin):
    def __init__(self, column):
        self.column = column 
        
    def fit(self, X, y=None):
        return self 
    
    def transform(self, X, y=None):
        return X[[self.column]].values 

class CategoricalExtractor(BaseEstimator, TransformerMixin):
    def __init__(self, column):
        self.column = column
        self.values = None
        
    def _create_values(self, indices):
        return {ind: i+1 for i, ind in enumerate(indices)}
    
    def _apply_values(self, row_val):
        return self.values.get(row_val, 0)
        
    def fit(self, X, y=None):
        self.values = self._create_values(X[self.column].value_counts().index)
        return self 
    
    def transform(self, X, y=None):
        col = X[self.column].apply(self._apply_values)
        return col.values.reshape(-1, 1)
```