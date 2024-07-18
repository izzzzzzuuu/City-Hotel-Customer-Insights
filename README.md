# City-Hotel-Customer-Insights

![image](https://github.com/user-attachments/assets/476cc68b-e7ef-4515-af6a-0bb303a4b26c)
![image](https://github.com/user-attachments/assets/2958cff7-4c38-4dd9-85da-d41345727719)


## Data Used

**Data** - City hotel dataset over 53140 rows and consist of 34 columns .

**Data cleaning & Data analysis** - Jupyter notebook (Python), MySQL Workbench

**Data Visualization** - PowerBI

## Aim
> Applying data cleaning technique, generating new columns, do analysis on the dataset, and visualize the dataset

## Questions

1. Average number of customer stays in (total no. of stays in / total no. cust checked in)
2. average confirmed customer by year
3. % customer checked in vs canceled or no show
4. Customer type distribution
5. Customer deposit type distribution
6. What is the distribution of our customer across country (not suitable for visualization, too sparse)
7. Calculate number of repeated customer and new customer by year
8. see how may total booking made in each year
9. Top 10 company in hotel booking
9. company overview total, confirmed, canceled bookings
10. agent overview total, confirmed, canceled bookings
11. Overall top market segment
12. Revenue distribution amongst distribution channel
13. Revenue distribution amongst market segment
14. Revenue distribution amongst distribution_channel
15. market segment total revenue, not canceled
16. distribution channel total revenue, not canceled
17. Revenue by year
18. Revenue loss by year

## Summary of Findings/Analysis
- In the span of 4 years 53k of bookings were made, however, only about 37k which is 69.81%  customer confirmed their bookings.
- Booking that is canceled or the customers does not show up accounts about more than a quarter (1/4) of the total bookings
- Highest bookings made are from Transient customer's type, followed by Transient-Party, Contract and lastly Group
- Majority of the customers pick 'No deposit' as their deposit type, followed by 'Non refund' and 'Refundable', however, they are less significant to the 'No Deposit' majority, as the combined value of those 2 types is less than 30.
- 'Non refund' has higher pick rate amongst confirmed customer than 'Refundable' because of their total bookings (canceled or not canceled) number is higher
- Countries in europe continent has the highest amount of confirmed bookings made compared to other continents.
- Portugal has the highest confirmed bookings, 8216, followed by France (5834), while Deutschland and Great Britain,UK shares almost the same number of bookings which is above 3000 and under 3600 bookings.
- Majority of the bookings confirmed made is from new customers which represents 96.04% of the total confirmed bookings made, while only 3.96% of the customer is repeated customer across the 3 year span.
- Most bookings made were on year 2016, while the least booking made is on year 2015. Total of new customer peaked at year 2016, presumably because of the major sports event which are UEFA EURO held in France, hence there are spike in hotel bookings specifically in Europe continent.
- In scope of bookings made by **agents**, only 68.04% of total bookings were confirmed. Highest confirmed bookings were made by agent 9, followed loosely by agent 7, then agent 14.
- In scope of bookings made by **company**, only 87.74% of total bookings were confirmed. Highest confirmed bookings were made by company 40, followed by company 45 then 153.
- Highest distribution channel that customer uses to book hotel are through channel Travel Agent (TA) and/or Tour Operator (TO), second highest are through direct booking on hotel receptionist, followed by Corporate, Global Distribution Systems (GDS) and lastly are from undefined channel. The result is as it is presumably because, TA/TO is the most preferred by customers as it is easier and more convenient for them rather than has to physically attend to the hotel themselves. For corporate scenario, there is only certain company that will held an event at the hotel as it is costly hence the data reflects that. As for GDS, it is uncommon for people to use this channel if they were not a frequent traveller.
- The data visualization and the table shows that the highest revenue generated are from TA/TO channel, and the least revenue generated are from GDS channel. The difference between each distribution channel is quite significant to one another, which reflects majority of the guests chose TA/TO channels or service to ensure their experience in booking hotel for their holiday is seamless and hassle-free as it is commonly in package deals.
- On the market segment, the highest number of bookings made were through online travel agent (TA) market, secondly, offline travel agent and tour operator (TA/TO), and followed closely on third is direct market segment, with the difference is less than a thousand. Other markets segments such as corporate and groups does not exceed 3000 bookings, while complementary and aviation market does not even reaching a thousand number of bookings made.
- Based on the table, highest revenue made is through online travel agent, with more than 8 million revenue being generated. On the other hand, in complementary market segment, the revenue generated is less than 2 thousands ringgit.
- Lastly, the table shows the total revenue generated across 3 years between 2015 until 2017 are RM 12,113,271.78 excluding year 2014 because data is not complete and all bookings made on 2014 were canceled. Potential revenue that counts as hotel loss are RM 4,808,028.08 because of the cancellation that were made by the customers. Hotel management need to consider doing more marketing and offer more attractive deals to potential customers to reduce the loss revenue which is 1/3 of the generated revenue. 

## Business suggestions
- Maintain and improve marketing strategy for Transient customer's type as they were the highest customer's base type.
-  Implement the strategy of marketing from Transient into Transient-Party, Contract and Group customers, to replicate the same success found on Transient customers. This can include giving a discount with terms and condition, promotions with certain timeframe or periods, and provide events, attractions, services or facilities to accomodate the customer, especially on holidays.
- 'No deposit' is highly choosen as it gives them freedom and leisure to make a booking first without prior commitment or financial loss on their end.
- To increase the likelihood of customer choosing 'Non refundable' deposit type, hotel can provides certain incentives such as free meal option between breakfast or dinner and lower price for 5% or 10% discount in price because of their commitment to bookings. Hence, the amount of customer that choose 'Non refund' deposit type can be improve.
- The percentage of repeated customer is critically low which is only 3.96% and needed to be improve and increase. Suggestion to improve the low percentage of the repeated customer is to introduce a loyalty membership of the hotel and provide exclusive perks to the customer that has been to the hotel more than 1 time. Besides that, give redeemable points to the loyal customers based of their spending at the hotel in form of cashbacks or promotional price events.
- Hotel managements need to maintain high numbers of conversion rate from booking to confirmed booking. This can be done by negotiating a win-win deals in terms of prices or commision reward for the highest contributor of the travel agents or the tour operator.
- Hotel management also need to reduce the number of bookings canceled by improving a follow up notifications  and cater customer needs by improving booking services based on the customer feedbacks, if given.
- It is suggested that hotel management, able to strike a deal with any high value corporate by offering them a promotion price for a month throughout the year to make it attractive for them to hold their company corporate event at the hotel.
- GDS conversion rate for confirmed booking need to be improve. This can be done by highlighting the benefits and specific perks for customers that uses this channel.
  

## Limitations

- There are incomplete data for year 2014, hence the performance of hotel for the year cant be accurately determine.
- There are undefined value in the dataset that should have been impute by using mode value to replace it, however it will lead to data inaccuracy hence, it is left as it is. 
