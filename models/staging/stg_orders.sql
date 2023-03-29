select 
-- from raw_order 
o.orderid,
o.orderdate,
o.shipmode,
o.shipdate,
o.ordersellingprice,
o.ordercostprice,
o.ordersellingprice - o.ordercostprice as profit,
---from raw_customer 
c.custid as customerid,
c.custname,
c.segment,
c.country,
-- from raw_product 
p.category,
p.productname,
p.subcategory,
p.productid ,
{{ markup('ordersellingprice','ordercostprice') }} as markup
from {{ ref('raw_order') }} as o
left join {{ ref('raw_customer') }} c
on o.customerid = c.custid 
left join {{ ref('raw_product') }} p
on o.productid = p.productid  