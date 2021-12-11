# Error Handling

Error handling in SQL Server gives us control over the Transact-SQL code.

+ Try...CATCH

```
BEGIN TRY  
     --code to try 
END TRY  
BEGIN CATCH  
     --code to run if an error occurs
--is generated in try
END CATCH
```

+ RAISEERROR

```
RAISERROR ( { msg_id | msg_str | @local_variable }  
    { ,severity ,state }  
    [ ,argument [ ,...n ] ] )  
    [ WITH option [ ,...n ] ]  
```

+ THROW

```
THROW [ { error_number | @local_variable },  
        { message | @local_variable },  
        { state | @local_variable } ]   
[ ; ] 
```


