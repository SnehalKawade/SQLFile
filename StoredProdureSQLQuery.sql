
select * from Department

--syntax for Stored Procedure
create procedure SP_Insert_Dept(@DId int,@DName varchar(20))
as begin
insert into Department values(@DId,@DName)
return
end

-- to alter the existing SP
alter procedure SP_Insert_Dept(@DId int, @DName varchar(20))
as begin
insert into Department values(@DId,@DName)
return
end


create procedure SP_Update_Dept(@DId int, @DName varchar(20))
as begin
update Department set DName=@DName where DId=@DId
return
end

create procedure SP_SelectAll_Dept
as begin
select * from Department
return
end
--excute query
exec SP_SelectAll_Dept

exec SP_Insert_Dept
@did=70,
@dname='Finaces'


