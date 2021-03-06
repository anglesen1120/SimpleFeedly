/****** Object:  UserDefinedFunction [dbo].[fnRemoveNonAlphaCharactersAndDigit]    Script Date: 9/8/2019 5:54:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnRemoveNonAlphaCharactersAndDigit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function [dbo].[fnRemoveNonAlphaCharactersAndDigit](@text NVARCHAR(MAX))
Returns NVARCHAR(MAX)
AS
Begin
    Declare @KeepValues as varchar(50)
SET @KeepValues = ''%[^a-zA-Z]%''
    While PatIndex(@KeepValues, @text) > 0
SET @text = STUFF(@text, PATINDEX(@KeepValues, @text), 1, '''')
    Return @text
End
' 
END
GO


