Class DATASHEETPKG.BS.RequestPLIExamServ Extends Ens.BusinessService
{

Parameter SETTINGS = "TargetConfigNames:Basic:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

Property TargetConfigNames As %String;

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    
    set tSC = $$$OK
    
    try {
     	//将请求消息放入%Stream.GlobalCharacter
		Set tRequestStream = ##class(%Stream.GlobalCharacter).%New()
		Set tSC = tRequestStream.CopyFrom(pInput.Content)
		Quit:$$$ISERR(tSC)
        set tRequest=##class(DATASHEETPKG.Message.pisRequestMessage).%New()
		set dynamicObj = ##class(%DynamicAbstractObject).%FromJSON(tRequestStream.Read())
		set enCode = dynamicObj.%Get("encryptionCode")
		set tRequest.EncryptionCode = enCode
        set tRequest.PathologyNumber = dynamicObj.%Get("PathologyNumber")
		//调业务规则路由
    	Set tSC = ..SendRequestSync(..TargetConfigNames, tRequest, .tResponse)
        Quit:$$$ISERR(tSC)
        
        //获得返回消息
        set pOutput = tResponse.Stream
      
   }catch (e){
       throw e
   }
   Quit tSC
}

}
