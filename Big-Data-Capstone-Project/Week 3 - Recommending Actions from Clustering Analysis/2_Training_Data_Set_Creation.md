## Training Data Set Creation

The training data set used for this analysis is shown below (first 5 lines):

```python
combined_df = ads_per_user.merge(game_clicks_per_user, on='userId')
# userId, adCount, clickCount
combined_df = combined_df.merge(revenue_per_user, on='userId')
# userId, adCount, clickCount, price

combined_df.head(5)
# display how the merged table looks
```

| userId | totalAdClicks | totalGameClicks | revenue |
|--------|---------------|-----------------|---------|
| 1      | 44            | 716             | 21.0    |
| 8      | 10            | 380             | 53.0    |
| 9      | 37            | 508             | 80.0    |
| 10     | 19            | 3107            | 11.0    |
| 12     | 46            | 704             | 215.0   |

Dimensions of the training data set (rows x columns): 543*3

\# of clusters created: 3
