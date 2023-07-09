create database customer_segmentation_analysis_project;
Use customer_segmentation_analysis_project;
create table customer_details (
customer_id int primary key,
firstname varchar(50),
lastname varchar(50),
age INT,
gender varchar(50), 
location varchar(50),
order_id INT,
order_date date,
order_value decimal(10,2)
);
insert into customer_details (customer_id, firstname, lastname, age, gender, location, order_id, order_date, order_value)
values
(1, "kevin", "Smith", 45, "Male", "Newyork", 19876, "2023-02-19", 876.87),
(2, "Ricky", "Ponting", 34, "Male", "Seattle", 17654, "2022-07-12", 1165.73),
(3, "Samantha", "Smith", 54, "Female", "London", 18765, "2021-11-03", 186.54),
(4, "John", "Ross", 36, "Male", "Netherlands", 17653, "2021-01-21", 176.32),
(5, "Taylor", "Swift", 46, "Female", "California", 17534, "2022-04-20", 398.23),
(6, "Lewis", "Hamilton", 36, "Male", "London", 16543, "2021-03-02", 665.23),
(7, "George", "Russel", 27, "Male", "Monaco", 176532, "2021-11-23", 1354.32),
(8, "Amy", "Andersen", 24, "Female", "Boston", 176322, "2019-03-02", 167.43);

SELECT
    customer_id,
    CASE
        WHEN total_purchase_value >= 1000 THEN 'High-Value Customer'
        WHEN total_purchase_value >= 500 THEN 'Medium-Value Customer'
        ELSE 'Low-Value Customer'
    END AS customer_segment
FROM (
    SELECT
        customer_id,
        SUM(order_value) AS total_purchase_value
    FROM customer_details
    GROUP BY customer_id
) AS customer_summary;











