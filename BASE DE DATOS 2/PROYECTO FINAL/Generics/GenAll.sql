Begin
	declare ctab cursor for SELECT name from sys.tables
	declare @t varchar(64)
	open ctab
	fetch ctab into @t
	while @@fetch_status = 0
	Begin
		Begin try 
			EXEC GenCreateInsert @t
			EXEC GenCreateUpdate @t
			EXEC GenCreateDelete @t
		End Try
		Begin catch
			print(@t)
			exec GetErrorInfo
		End Catch
		fetch ctab into @t
	END
	close ctab
	deallocate ctab
End


