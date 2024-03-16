CREATE TABLE [loan_ticket] (
  [id] integer(10) PRIMARY KEY IDENTITY(1, 1),
  [borrower_id] integer(10) NOT NULL,
  [loan_type] varchar(50) NOT NULL,
  [loan_amount] decimal(10,2) NOT NULL,
  [loan_tenure_in_months] integer(10) NOT NULL,
  [interest_rate] decimal(3,2) NOT NULL,
  [start_date] datetime NOT NULL,
  [end_date] datetime NOT NULL,
  [status] varchar[50] NOT NULL DEFAULT 'Ongoing',
  [remark] text,
  [created_at] timestamp DEFAULT 'now()'
)
GO

CREATE TABLE [borrower] (
  [id] integer(10) PRIMARY KEY IDENTITY(1, 1),
  [first_name] varchar(50) NOT NULL,
  [last_name] varchar(50) NOT NULL,
  [mobile] integer(10) NOT NULL,
  [alternate_mobile] integer(10) NOT NULL,
  [state] varchar(50) NOT NULL,
  [district] varchar(50) NOT NULL,
  [pincode] integer(6) NOT NULL,
  [address] varchar(250) NOT NULL,
  [account_number] varchar(50) NOT NULL,
  [ifsc_code] varchar(11) NOT NULL,
  [bank_name] varchar(50) NOT NULL,
  [branch_name] varchar(50) NOT NULL,
  [created_at] timestamp DEFAULT 'now()'
)
GO

CREATE TABLE [emi] (
  [id] integer(10) PRIMARY KEY IDENTITY(1, 1),
  [loan_ticket_id] integer(10) NOT NULL,
  [emi_no] integer(10) NOT NULL,
  [emi_amount] decimal(10,2) NOT NULL,
  [outstanding_amount] decimal(10,2) NOT NULL,
  [start_date] datetime NOT NULL,
  [end_date] datetime NOT NULL,
  [payment_id] integer(10) NOT NULL,
  [status] varchar(50) NOT NULL DEFAULT 'Pending',
  [created_at] timestamp DEFAULT 'now()',
  [remark] text,
  [penalty_id] integer(10)
)
GO

CREATE TABLE [documents] (
  [id] integer(10) PRIMARY KEY IDENTITY(1, 1),
  [document_name] varchar(50) NOT NULL,
  [dcoument_folder] varchar(50) NOT NULL,
  [created_at] timestamp DEFAULT 'now()'
)
GO

CREATE TABLE [kyc] (
  [id] integer(10) PRIMARY KEY IDENTITY(1, 1),
  [status] varchar(50) NOT NULL DEFAULT 'Pending',
  [borrower_id] integer(10) NOT NULL,
  [aadhar_number] integer(12) UNIQUE,
  [pan_number] varchar(10) UNIQUE,
  [documents_id] integer[],
  [completion_date] datetime,
  [created_at] timestamp DEFAULT 'now()',
  [remark] text
)
GO

CREATE TABLE [penalty] (
  [id] integer(10) PRIMARY KEY IDENTITY(1, 1),
  [status] varchar(50) DEFAULT 'Pending',
  [emi_id] integer(10) NOT NULL,
  [amount] decimal(11,2) NOT NULL,
  [payment_id] integer(10) NOT NULL,
  [due_date] datetime,
  [remark] text
)
GO

CREATE TABLE [payments] (
  [id] integer(10) PRIMARY KEY IDENTITY(1, 1),
  [amount] decimal(10,2) NOT NULL,
  [payment_mode] varchar(50) NOT NULL,
  [emi_id] integer(10) NOT NULL,
  [bank_reference_id] varchar(50) NOT NULL,
  [payment_date] datetime,
  [remark] text
)
GO

ALTER TABLE [loan_ticket] ADD FOREIGN KEY ([borrower_id]) REFERENCES [borrower] ([id])
GO

ALTER TABLE [emi] ADD FOREIGN KEY ([loan_ticket_id]) REFERENCES [loan_ticket] ([id])
GO

ALTER TABLE [kyc] ADD FOREIGN KEY ([documents_id]) REFERENCES [documents] ([id])
GO

ALTER TABLE [payments] ADD FOREIGN KEY ([emi_id]) REFERENCES [emi] ([id])
GO

ALTER TABLE [kyc] ADD FOREIGN KEY ([borrower_id]) REFERENCES [borrower] ([id])
GO

ALTER TABLE [penalty] ADD FOREIGN KEY ([emi_id]) REFERENCES [emi] ([id])
GO

ALTER TABLE [penalty] ADD FOREIGN KEY ([payment_id]) REFERENCES [payments] ([id])
GO

ALTER TABLE [emi] ADD FOREIGN KEY ([payment_id]) REFERENCES [payments] ([id])
GO
