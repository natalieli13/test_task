create or alter trigger TR_Basket_insert_update  
on Basket   
instead of insert  
as
	insert into Basket
	select
		ID_SKU,
		ID_Family,
		Quantity,
		Value,
		PurchaseDate,
		case
			when ID_SKU in
				(select
					ID_SKU
				from 
					inserted 
				group by
					ID_SKU
				having
					count(ID_SKU) > 1)

				then Value * 0.05
			else
				0
			end
	from
		inserted