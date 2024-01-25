Class DATASHEETPKG.Message.callPISRequest Extends (Ens.Request, %JSON.Adaptor)
{

Property PathologyNumber As %String;

Storage Default
{
<Data name="callPISRequestDefaultData">
<Subscript>"callPISRequest"</Subscript>
<Value name="1">
<Value>PathologyNumber</Value>
</Value>
</Data>
<DefaultData>callPISRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
