create table SKU (
    ID int identity primary key,
    Code as ('s' + cast(ID as varchar)) unique,
    [Name] varchar(255)
);

create table Family  (
    ID int identity primary key,
    SurName varchar(255),
    BudgetValue int
);

create table Basket (
    ID int identity primary key,
    ID_SKU int foreign key references SKU(ID),
    ID_Family int foreign key references Family(ID),
    Quantity int check (Quantity >= 0),
    Value decimal(18,2) check (Value >= 0),
    PurchaseDate datetime default GETDATE(),
    DiscountValue decimal(18,2)
);
