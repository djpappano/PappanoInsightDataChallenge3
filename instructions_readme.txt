Instructions from Roni on the Data Challenge

There is a large dataset containing geographical information about points of sale for products, for thousands of customers and thousands of products. The original dataset was in the form of 3 tables:


supermarket_distances: three columns. The first column is the customer id, the second is the shop id and the third is the distance between the customer’s house and the shop location. The distance is a calculated in meters as a straight line so it does not take into account the road graph.

supermarket_prices: two columns. The first column is the product id and the second column is its unit price. The price is in Euro and it is calculated as the average unit price for the time span of the dataset.

supermarket_purchases: four columns. The first column is the customer id, the second is the product id, the third is the shop id and the fourth is the total amount of items that the customer bought the product in that particular shop. 


The data is recorded from January 2007 to December 2011.
For ease of analysis, today we will be working with an aggregated version of the dataset.  The data is aggregated by customer, and info from different shops are pivoted to new columns.  We've added this file (csv format) to the "Data Challenges" Dropbox folder.
