select 
--from raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice-o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
--from raw_customer
c.customername,
c.segment,
c.customerid,
--from raw_product
c.country,
p.productid,
p.category,
p.productname,
p.subcategory,
{{ markup('o.ordersellingprice','o.ordercostprice') }} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid=c.customerid
left join {{ ref('raw_product') }} as p
on o.productid=p.productid