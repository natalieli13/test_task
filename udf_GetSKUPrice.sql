create function udf_GetSKUPrice(@ID_SKU int)
returns decimal(18,2) as
begin
	declare @SKUPrice decimal(18,2);
	set @SKUPrice = 
	(select
		sum(Value)/sum(Quantity)
	from
		dbo.Basket
	where
		ID_SKU = @ID_SKU);
	return @SKUPrice;
end;