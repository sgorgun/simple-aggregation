SELECT
    SUM(order_details.product_amount) AS product_total,
    SUM(order_details.price_with_discount * order_details.product_amount) AS to_pay_total,
    SUM((order_details.price - order_details.price_with_discount) * order_details.product_amount) AS discount_total
FROM
    order_details
JOIN
    customer_order ON order_details.customer_order_id = customer_order.id
JOIN
    customer ON customer_order.customer_id = customer.person_id
WHERE
    customer.discount > 0;
