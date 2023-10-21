
--PRINTF() function to format the total_amount_due as currency, ensuring it displays two decimal places and $.
select customers.customer_name as Customer, 
 PRINTF("$%.2f",sum(subscriptions.price_per_month * subscriptions.subscription_length)) 
 as "Amount Due"
 
/* inner join orders to customers */
from orders
inner join customers
 on customers.customer_id = orders.customer_id

inner join subscriptions
 on subscriptions.subscription_id = orders.subscription_id

where subscriptions.description = "Fashion Magazine"
 and orders.order_status = "unpaid"

group by Customer;