-- Sales Performance
-- Business Question: How did sales performance change over time?

SELECT
    YEAR(o.order_purchase_timestamp) AS year,
    MONTH(o.order_purchase_timestamp) AS month,

    SUM(oi.price + oi.freight_value) AS revenue,

    COUNT(DISTINCT o.order_id) AS orders,

    SUM(oi.price + oi.freight_value)
        / COUNT(DISTINCT o.order_id) AS aov

FROM [dbo].[olist_orders_dataset] o

JOIN [dbo].[olist_order_items_dataset] oi
    ON o.order_id = oi.order_id

GROUP BY
    YEAR(o.order_purchase_timestamp),
    MONTH(o.order_purchase_timestamp)

ORDER BY
    year,
    month;

   ---BQ2: Which product categories generate the highest revenue?

SELECT
    t.column2 AS category,
    SUM(oi.price + oi.freight_value) AS revenue

FROM [dbo].[olist_order_items_dataset] oi

JOIN [dbo].[olist_products_dataset] p
    ON oi.product_id = p.product_id

JOIN [dbo].[product_category_name_translation] t
    ON p.product_category_name = t.column2

GROUP BY
    t.column2

ORDER BY
    revenue DESC;

    -- BQ3: Which customer states generate the lowest revenue?

SELECT
    c.customer_state,
    SUM(oi.price + oi.freight_value) AS revenue

FROM [dbo].[olist_orders_dataset] o

JOIN [dbo].[olist_order_items_dataset] oi
    ON o.order_id = oi.order_id

JOIN [dbo].[olist_customers_dataset] c
    ON o.customer_id = c.customer_id

GROUP BY
    c.customer_state

ORDER BY
    revenue ASC;

SELECT
    c.customer_state,
    SUM(oi.price + oi.freight_value) AS revenue

FROM [dbo].[olist_orders_dataset] o

JOIN [dbo].[olist_order_items_dataset] oi
    ON o.order_id = oi.order_id

JOIN [dbo].[olist_customers_dataset] c
    ON o.customer_id = c.customer_id

GROUP BY
    c.customer_state

ORDER BY
    revenue ASC;

    --BQ4: What is Olist's overall sales performance in revenue, orders, average order value and quantity sold?

SELECT
    SUM(oi.price + oi.freight_value) AS revenue,

    COUNT(DISTINCT o.order_id) AS orders,

    SUM(oi.price + oi.freight_value)
        / COUNT(DISTINCT o.order_id) AS average_order_value,

    COUNT(oi.order_item_id) AS quantity_sold

FROM [dbo].[olist_orders_dataset] o

JOIN [dbo].[olist_order_items_dataset] oi
    ON o.order_id = oi.order_id;

    -- Customer Retetion & Behaivor
    -- Business Question 1: What is the proportion of Olist's customers that has made repeat purchases?

SELECT
    COUNT(CASE WHEN order_count > 1 THEN 1 END) AS repeat_customers,

    COUNT(*) AS total_customers,

    CAST(COUNT(CASE WHEN order_count > 1 THEN 1 END) AS DECIMAL(10,2))
        / COUNT(*) * 100 AS repeat_customer_rate

FROM
(
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count

    FROM [dbo].[olist_customers_dataset] c

    JOIN [dbo].[olist_orders_dataset] o
        ON c.customer_id = o.customer_id

    GROUP BY
        c.customer_unique_id
) AS customer_orders;

-- BQ2: How has repeat customers rate changed over time?

SELECT
    YEAR(o.order_purchase_timestamp) AS year,
    MONTH(o.order_purchase_timestamp) AS month,

    COUNT(DISTINCT o.customer_id) AS total_customers,

    COUNT(DISTINCT
        CASE
            WHEN o.order_purchase_timestamp > fp.first_purchase_date
            THEN o.customer_id
        END
    ) AS repeat_customers,

    CAST(
        COUNT(DISTINCT
            CASE
                WHEN o.order_purchase_timestamp > fp.first_purchase_date
                THEN o.customer_id
            END
        ) AS DECIMAL(10,2)
    )
    / COUNT(DISTINCT o.customer_id) * 100 AS repeat_customer_rate

FROM [dbo].[olist_orders_dataset] o

JOIN
(
    SELECT
        customer_id,
        MIN(order_purchase_timestamp) AS first_purchase_date

    FROM [dbo].[olist_orders_dataset]

    GROUP BY
        customer_id

) AS fp
    ON o.customer_id = fp.customer_id

GROUP BY
    YEAR(o.order_purchase_timestamp),
    MONTH(o.order_purchase_timestamp)

ORDER BY
    year,
    month;

    -- BQ3: How does revenue contribution differ between repeatand non repeat customers?

SELECT
    CASE
        WHEN co.order_count > 1
            THEN 'Repeat Customer'
        ELSE 'Non-Repeat Customer'
    END AS customer_type,

    SUM(oi.price + oi.freight_value) AS revenue

FROM [dbo].[olist_orders_dataset] o

JOIN [dbo].[olist_order_items_dataset] oi
    ON o.order_id = oi.order_id

JOIN [dbo].[olist_customers_dataset] c
    ON o.customer_id = c.customer_id

JOIN
(
    SELECT
        c2.customer_unique_id,
        COUNT(DISTINCT o2.order_id) AS order_count

    FROM [dbo].[olist_customers_dataset] c2

    JOIN [dbo].[olist_orders_dataset] o2
        ON c2.customer_id = o2.customer_id

    GROUP BY
        c2.customer_unique_id
) AS co
    ON c.customer_unique_id = co.customer_unique_id

GROUP BY
    CASE
        WHEN co.order_count > 1
            THEN 'Repeat Customer'
        ELSE 'Non-Repeat Customer'
    END;

    --BQ4: How does repeat customer rate change alongside order volume over time?

WITH CustomerFirstPurchase AS
(
    SELECT
        c.customer_unique_id,
        MIN(o.order_purchase_timestamp) AS first_purchase_date

    FROM [dbo].[olist_customers_dataset] c

    JOIN [dbo].[olist_orders_dataset] o
        ON c.customer_id = o.customer_id

    GROUP BY
        c.customer_unique_id
)

SELECT
    YEAR(o.order_purchase_timestamp) AS year,
    MONTH(o.order_purchase_timestamp) AS month,

    COUNT(DISTINCT o.order_id) AS orders,

    COUNT(DISTINCT c.customer_unique_id) AS total_customers,

    COUNT(DISTINCT
        CASE
            WHEN o.order_purchase_timestamp > fp.first_purchase_date
            THEN c.customer_unique_id
        END
    ) AS repeat_customers,

    CAST(
        COUNT(DISTINCT
            CASE
                WHEN o.order_purchase_timestamp > fp.first_purchase_date
                THEN c.customer_unique_id
            END
        ) AS DECIMAL(10,2)
    )
    / COUNT(DISTINCT c.customer_unique_id) * 100
    AS repeat_customer_rate

FROM [dbo].[olist_orders_dataset] o

JOIN [dbo].[olist_customers_dataset] c
    ON o.customer_id = c.customer_id

JOIN CustomerFirstPurchase fp
    ON c.customer_unique_id = fp.customer_unique_id

GROUP BY
    YEAR(o.order_purchase_timestamp),
    MONTH(o.order_purchase_timestamp)

ORDER BY
    year,
    month;

    -- Delivery/Sellers Performance
    -- Business Question: How has Olist's on-time delivery performance changed over time?

SELECT
    YEAR(o.order_purchase_timestamp) AS year,
    MONTH(o.order_purchase_timestamp) AS month,

    COUNT(DISTINCT o.order_id) AS delivered_orders,

    COUNT(DISTINCT
        CASE
            WHEN o.order_delivered_customer_date
                 <= o.order_estimated_delivery_date
            THEN o.order_id
        END
    ) AS on_time_orders,

    CAST(
        COUNT(DISTINCT
            CASE
                WHEN o.order_delivered_customer_date
                     <= o.order_estimated_delivery_date
                THEN o.order_id
            END
        ) AS DECIMAL(10,2)
    )
    / COUNT(DISTINCT o.order_id) * 100 AS on_time_delivery_rate

FROM [dbo].[olist_orders_dataset] o

WHERE o.order_delivered_customer_date IS NOT NULL

GROUP BY
    YEAR(o.order_purchase_timestamp),
    MONTH(o.order_purchase_timestamp)

ORDER BY
    year,
    month;

    -- BQ2: Which sellers states have the highest late orders share?

SELECT
    s.seller_state,

    COUNT(DISTINCT o.order_id) AS total_orders,

    COUNT(DISTINCT
        CASE
            WHEN o.order_delivered_customer_date
                 > o.order_estimated_delivery_date
            THEN o.order_id
        END
    ) AS late_orders,

    CAST(
        COUNT(DISTINCT
            CASE
                WHEN o.order_delivered_customer_date
                     > o.order_estimated_delivery_date
                THEN o.order_id
            END
        ) AS DECIMAL(10,2)
    )
    / COUNT(DISTINCT o.order_id) * 100 AS late_order_share

FROM [dbo].[olist_orders_dataset] o

JOIN [dbo].[olist_order_items_dataset] oi
    ON o.order_id = oi.order_id

JOIN [dbo].[olist_sellers_dataset] s
    ON oi.seller_id = s.seller_id

WHERE o.order_delivered_customer_date IS NOT NULL

GROUP BY
    s.seller_state

ORDER BY
    late_order_share DESC;

    --BQ3: Which seller states have the lowest on-time delivery rates?

SELECT
    s.seller_state,

    COUNT(DISTINCT o.order_id) AS total_orders,

    COUNT(DISTINCT
        CASE
            WHEN o.order_delivered_customer_date
                 <= o.order_estimated_delivery_date
            THEN o.order_id
        END
    ) AS on_time_orders,

    CAST(
        COUNT(DISTINCT
            CASE
                WHEN o.order_delivered_customer_date
                     <= o.order_estimated_delivery_date
                THEN o.order_id
            END
        ) AS DECIMAL(10,2)
    )
    / COUNT(DISTINCT o.order_id) * 100 AS on_time_delivery_rate

FROM [dbo].[olist_orders_dataset] o

JOIN [dbo].[olist_order_items_dataset] oi
    ON o.order_id = oi.order_id

JOIN [dbo].[olist_sellers_dataset] s
    ON oi.seller_id = s.seller_id

WHERE o.order_delivered_customer_date IS NOT NULL

GROUP BY
    s.seller_state

ORDER BY
    on_time_delivery_rate ASC;

    -- BQ4: What is the average delivery time for delivered orders?

SELECT
    AVG(
        DATEDIFF(
            DAY,
            o.order_purchase_timestamp,
            o.order_delivered_customer_date
        )
    ) AS average_delivery_days

FROM [dbo].[olist_orders_dataset] o

WHERE o.order_delivered_customer_date IS NOT NULL;

-- BQ5: Is repeat customer rate different between on-time and late deliveries?

SELECT
    CASE
        WHEN o.order_delivered_customer_date
             <= o.order_estimated_delivery_date
            THEN 'On-Time'
        ELSE 'Late'
    END AS delivery_status,

    COUNT(DISTINCT c.customer_unique_id) AS total_customers,

    COUNT(DISTINCT
        CASE
            WHEN co.order_count > 1
            THEN c.customer_unique_id
        END
    ) AS repeat_customers,

    CAST(
        COUNT(DISTINCT
            CASE
                WHEN co.order_count > 1
                THEN c.customer_unique_id
            END
        ) AS DECIMAL(10,2)
    )
    / COUNT(DISTINCT c.customer_unique_id) * 100
    AS repeat_customer_rate

FROM [dbo].[olist_orders_dataset] o

JOIN [dbo].[olist_customers_dataset] c
    ON o.customer_id = c.customer_id

JOIN
(
    SELECT
        c2.customer_unique_id,
        COUNT(DISTINCT o2.order_id) AS order_count

    FROM [dbo].[olist_customers_dataset] c2

    JOIN [dbo].[olist_orders_dataset] o2
        ON c2.customer_id = o2.customer_id

    GROUP BY
        c2.customer_unique_id
) AS co
    ON c.customer_unique_id = co.customer_unique_id

WHERE o.order_delivered_customer_date IS NOT NULL

GROUP BY
    CASE
        WHEN o.order_delivered_customer_date
             <= o.order_estimated_delivery_date
            THEN 'On-Time'
        ELSE 'Late'
    END;