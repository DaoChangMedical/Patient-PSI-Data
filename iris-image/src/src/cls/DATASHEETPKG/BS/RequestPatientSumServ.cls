Class DATASHEETPKG.BS.RequestPatientSumServ Extends Ens.BusinessService
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
	    
		//使用DynamicObject，获得请求的Json消息中的busiCode值
		//set dynamicObj = ##class(%DynamicAbstractObject).%FromJSON(tRequestStream.Read())
 		//set busiCode = dynamicObj.%Get("busiCode")

		//为了后续的消息路由，将busiCode值作为attributes存放于Ens.StreamContainer
		//set arr=##class(%ArrayOfDataTypes).%New()
 		//do arr.SetAt(busiCode,"busiCode")
 	
 		// 将请求消息和busiCode值一起存放于%Stream.GlobalCharacter
		//set tRequest=##class(Ens.StreamContainer).%New(tRequestStream,arr)
	    //set tRequest=##class(DATASHEETPKG.Message.PatientReqeustMsg).%New()
        set tRequest=##class(EnsLib.REST.GenericMessage).%New()
		set dynamicObj = ##class(%DynamicAbstractObject).%FromJSON(tRequestStream.Read())
		set enCode = dynamicObj.%Get("encryptionCode")
		do tRequest.HTTPHeaders.SetAt(enCode,"encryptionCode")
		//调业务规则路由
    	Set tSC = ..SendRequestSync(..TargetConfigNames, tRequest, .tResponse)
    	//添加SearchTable
    	//Set tSC = ##class(Demo.CustomSearchTable.Sample).IndexDoc(tRequest)
        
        Quit:$$$ISERR(tSC)
        
        //获得返回消息
        set pOutput = tResponse.Stream
        

		//下方代码OK
        #; Set tRequestStream = ##class(%Stream.GlobalCharacter).%New()
		#; Set tSC = tRequestStream.CopyFrom(pInput.Content)
		#; Quit:$$$ISERR(tSC)
		#; set tRequest=##class(EnsLib.REST.GenericMessage).%New()
		#; set dynamicObj = ##class(%DynamicAbstractObject).%FromJSON(tRequestStream.Read())
		#; do tRequest.HTTPHeaders.SetAt("/Test","URLP")
		#; //调业务规则路由
    	#; Set tSC = ..SendRequestSync(..TargetConfigNames, tRequest, .tResponse)
    	#; //添加SearchTable
    	#; //Set tSC = ##class(Demo.CustomSearchTable.Sample).IndexDoc(tRequest)
        
        #; Quit:$$$ISERR(tSC)
        
        #; //获得返回消息
        #; set pOutput = tResponse.Stream
      
   }catch (e){
       throw e
   }
   Quit tSC
}

}
