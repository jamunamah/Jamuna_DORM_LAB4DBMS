CREATE DEFINER=`root`@`localhost` PROCEDURE `SupplierDetails`()
BEGIN
Select Supplier_ID, Supplier_Name, Rating, 
Case
	when Rating = 5 then "Excellent Service"
    when Rating = 4 then "Good Service"
    when Rating between 2 and 3 then "Average Service"
    else "Poor Service"
end as Type_of_Service from

(Select S.supp_id as Supplier_ID, S.supp_name as Supplier_Name, R.rat_ratstars as Rating
from rating as R
inner join `order` as O on R.ord_id = O.ord_id
inner join supplier_pricing as SP on O.pricing_id = SP.pricing_id
inner join supplier as S on SP.supp_id = S.supp_id order by S.supp_id) as T;
END