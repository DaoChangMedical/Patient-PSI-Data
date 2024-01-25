Class DATASHEETPKG.Message.pisRequestMessage Extends Ens.Request
{

Property PathologyNumber As %String;

Property EncryptionCode As %String;

Storage Default
{
<Data name="pisRequestMessageDefaultData">
<Subscript>"pisRequestMessage"</Subscript>
<Value name="1">
<Value>PathologyNumber</Value>
</Value>
<Value name="2">
<Value>EncryptionCode</Value>
</Value>
</Data>
<DefaultData>pisRequestMessageDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
