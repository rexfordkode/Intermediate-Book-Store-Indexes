select * from customers
limit 10;
SELECT * FROM orders
limit 10;
select * from books
limit 10;

select *
from pg_indexes
where tablename = 'customers';

select *
from pg_indexes
where tablename = 'orders';

select *
from pg_indexes
where tablename = 'books';

explain analyze select customer_id, quantity from orders
where quantity > 18;

create index customer_id_quantity_idx ON orders (customer_id, quantity);

explain analyze select customer_id, quantity from orders
where quantity > 18;

alter table customers add primary key (customer_id);

explain analyze select * from customers where customer_id < 100;

create index customer_id_idx on customers (customer_id)
where customer_id < 100;

select * from pg_Indexes
where tablename = 'customers';

cluster customers using customers_pkey;

create index customer_id_book_id_idx on orders(customer_id, book_id);

drop index if exists customer_id_book_id_idx;

create index customer_id_book_id_quantity_idx 
ON orders(customer_id, book_id, quantity);

create index author_title_idx 
ON books(author, title);

explain analyze select * from orders
where (quantity * price_base) > 100;

create index quantity_price_base_idx ON orders ((quantity * price_base));

explain analyze select * from orders
where (quantity * price_base) > 100;

