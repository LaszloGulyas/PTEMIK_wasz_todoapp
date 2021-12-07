CREATE TABLE Tasks
(
    [TaskID] INT IDENTITY(1,1) PRIMARY KEY, 
    [TaskName] NVARCHAR(50) NULL, 
    [TaskDescription] NVARCHAR(500) NULL, 
    [TaskDateOfCreation] DATETIME NULL, 
    [TaskDueDate] DATETIME NULL, 
    [TaskIsCompleted] BIT NULL
)