Class DATASHEETPKG.BS.Interface.Business Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/callPatientSumServ" Method="POST" Call="CallPatientSumServ"/>
<Route Url="/callPLIExamServ" Method="POST" Call="CallPLIExamServ"/>
</Routes>
}

/// Call Business Service
ClassMethod CallPatientSumServ() As %Status
{
	Set tSC = $$$OK

	Try 
    {
        #; Ensure we are only passed json
        If %request.ContentType'="application/json" 
        {  
            Set %response.Status=..#HTTP415UNSUPPORTEDMEDIATYPE
            Quit
        }

        If '$IsObject(%request.Content) 
        {
            Set tSC=$$$ERROR(-10001,"没有提交的Content")
            Set %response.Status=..#HTTP400BADREQUEST
            Quit    
        }
       
       	//调BS
		set tSC = ##class(Ens.Director).CreateBusinessService("RequestPatientSumService", .tService)
		
		//触发BS的OnProcessInput函数
		set tSC = tService.OnProcessInput(%request, .pResponse)
		
		//返回消息
        w pResponse.Read()
    }
    catch (ex)
    {
	  throw ex
    }
    
    //Return %response
	Quit tSC
}

ClassMethod CallPLIExamServ() As %Status
{
	Set tSC = $$$OK

	Try 
    {
        #; Ensure we are only passed json
        If %request.ContentType'="application/json" 
        {  
            Set %response.Status=..#HTTP415UNSUPPORTEDMEDIATYPE
            Quit
        }

        If '$IsObject(%request.Content) 
        {
            Set tSC=$$$ERROR(-10001,"没有提交的Content")
            Set %response.Status=..#HTTP400BADREQUEST
            Quit    
        }
       
       	//调BS
		set tSC = ##class(Ens.Director).CreateBusinessService("RequestPLIExamServ", .tService)
		
		//触发BS的OnProcessInput函数
		set tSC = tService.OnProcessInput(%request, .pResponse)
		
		//返回消息
        w pResponse.Read()
    }
    catch (ex)
    {
	  throw ex
    }
    
    //Return %response
	Quit tSC
}

}
