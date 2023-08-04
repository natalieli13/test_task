create procedure usp_MakeFamilyPurchase(@FamilySurName varchar(255))
as
	declare @ErrMsg varchar(255);
	set @ErrMsg = 'The family "' + @FamilySurName + '" does not exist.';
	if not exists(select 
					SurName
				from     
					Family
				where
					SurName = @FamilySurName)

	throw 51000, @ErrMsg, 1;

	declare @BasketSum decimal(18,2);
	set @BasketSum = 
	(select 
		sum(Basket.Value)
	from     
		Basket 
			INNER JOIN Family ON Basket.ID_Family = Family.ID
	where
		Family.SurName = @FamilySurName)

	update Family
    set BudgetValue = BudgetValue - @BasketSum
    where  SurName = @FamilySurName;