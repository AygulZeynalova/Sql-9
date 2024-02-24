create table [dbo].[Products](
[Name] nvarchar(100),
[Slug] nvarchar(100),
[StockKeepingUnit] nvarchar(100),
[ShortDescription] nvarchar(100),
[Description] nvarchar(100),
[Rate] decimal,
[CategoryId] int,
[BrandId] int,
[CreateAt] datetime not null default getdate(),
[CreatedBy] int,
[LastModifiedAt] datetime,
[LastModifiedBy] int,
[DeletedAt] datetime,
[DeletedBy] int
)

create table [dbo].Sizes(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[SmallName] nvarchar(100),
[CreateAt] datetime not null default getdate(),
[CreatedBy] int,
[LastModifiedAt] datetime,
[LastModifiedBy] int,
[DeletedAt] datetime,
[DeletedBy] int
)

create table [dbo].[Colors](
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[HexCode] nvarchar(100),
[CreateAt] datetime not null default getdate(),,
[CreatedBy] int,
[LastModifiedAt] datetime,
[LastModifiedBy] int,
[DeletedAt] datetime,
[DeletedBy] int
)

create table [dbo].[Brands](
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[CreateAt] datetime not null default getdate(),
[CreatedBy] int,
[LastModifiedAt] datetime,
[LastModifiedBy] int,
[DeletedAt] datetime,
[DeletedBy] int
)

alter table [dbo].[Products]

add constraint FK_Product_Brand foreign key([BrandId]) references [dbo].[Brands]([Id])

create table [dbo].[SpecificationValues](
[SpecificationId] int,
[ProductId] int,
[Value] varchar(100)
)
alter table [dbo].[Products]
add constraint FK_Product_SpecificationValues foreign key([SpecificationId]) references [dbo].[SpecificationValues]([Id])

create table [dbo].[ProductImages](
[Id] int,
[Name] nvarchar(100),
[IsMain] bit,
[ProductId] int
)

alter table [dbo].[Products]
add constraint FK_Product_Images foreign key ([ProductId]) references [dbo].[ProductImages]([Id])


create table [dbo].[Categories](
[Id] int identity(1,1),
[ParentId] int,
[Name] nvarchar(100),
[CreateAt] datetime not null default getdate(),
[CreatedBy] int,
[LastModifiedAt] datetime,
[LastModifiedBy] int,
[DeletedAt] datetime,
[DeletedBy] int,
constraint PK_Categories primary key([Id]),
constraint FK_Categories_Categories foreign key([ParentId]) references [dbo].[Categories]([Id]) 
)

create table [dbo].[BlogPost](
[Id] int identity(1,1),
[Title] nvarchar(100),
[Slug] nvarchar(100),
[Body] nvarchar(100),
[ImagePath] nvarchar(100),
[Rate] decimal,
[PublishedBy] int,
[PublishedAt] datetime,
[CategoryId] int,
[CreateAt] datetime not null default getdate(),
[CreatedBy] int,
[LastModifiedAt] datetime,
[LastModifiedBy] int,
[DeletedAt] datetime,
[DeletedBy] int,
)
alter table [dbo].[Products]
add constraint FK_BlogPost_Product foreign key ([CategoryId]) references [dbo].[Products]([Id])

create table [dbo].[Specifications] (
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[CreateAt] datetime not null default getdate(),
[CreatedBy] int,
[LastModifiedAt] datetime,
[LastModifiedBy] int,
[DeletedAt] datetime,
[DeletedBy] int
)

alter table [dbo].[SpecificationsValues]
add constraint FK_Specifications_Product foreign key ([Id]) references [dbo].[SpecificationsValues]([SpecificationId])